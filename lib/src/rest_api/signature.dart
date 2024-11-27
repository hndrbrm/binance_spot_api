// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:convert/convert.dart';
import 'package:cryptography/cryptography.dart';

/// SIGNED endpoints require an additional parameter, signature, to be sent
/// in the query string or request body.
///
/// The signature is not case sensitive.
///
/// Please consult the examples as in the references on how to compute
/// signature, depending on which API key type you are using.
///
/// A SIGNED endpoint also requires a parameter, timestamp, to be sent which
/// should be the millisecond timestamp of when the request was created and
/// sent.
///
/// An additional parameter, recvWindow, may be sent to specify the number
/// of milliseconds after timestamp the request is valid for. If recvWindow
/// is not sent, it defaults to 5000.
///
/// The logic is as follows:
/// if (timestamp < (serverTime + 1000) && (serverTime - timestamp) <= recvWindow) {
///   // process request
/// } else {
///   // reject request
/// }
///
/// Serious trading is about timing. Networks can be unstable and unreliable,
/// which can lead to requests taking varying amounts of time to reach the
/// servers. With recvWindow, you can specify that the request must be
/// processed within a certain number of milliseconds or be rejected by
/// the server.
///
/// It is recommended to use a small recvWindow of 5000 or less!
/// The max cannot go beyond 60,000!
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#signed-trade-and-user_data-endpoint-security
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#signed-endpoint-examples-for-post-apiv3order
final class Signature {
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#hmac-keys
  static Future<String> hmac(String secretKey, String queries) async {
    final hmac = Hmac.sha256();
    var mac = await hmac.calculateMac(
      utf8.encode(queries),
      secretKey: SecretKey(utf8.encode(secretKey)),
    );
    return hex.encode(mac.bytes);
  }

  /// We support PKCS#8 currently.
  ///
  /// To get your API key, you need to upload your RSA Public Key to your
  /// account and a corresponding API key will be provided for you.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#rsa-keys
  static Future<String> rsa(String pem, String queries) async {
    final (modulus, publicExponent, privateExponent) = _keyFromPem(pem);

    final keyPair = SimpleKeyPairData(
      privateExponent,
      publicKey: SimplePublicKey(
        publicExponent + modulus,
        type: KeyPairType.rsa,
      ),
      type: KeyPairType.rsa,
    );

    final algorithm = RsaSsaPkcs1v15(Sha256());
    final signature = await algorithm.sign(
      utf8.encode(queries),
      keyPair: keyPair
    );
    return Uri.encodeComponent(base64Encode(signature.bytes));
  }

  /// It is highly recommended to use Ed25519 API keys as it should provide
  /// the best performance and security out of all supported key types.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#ed25519-keys
  Future<String> ed25519(String pem, String queries) async {
    final (modulus, publicExponent, privateExponent) = _keyFromPem(pem);

    final keyPair = SimpleKeyPairData(
      privateExponent,
      publicKey: SimplePublicKey(
        publicExponent + modulus,
        type: KeyPairType.ed25519,
      ),
      type: KeyPairType.ed25519,
    );

    final algorithm = Ed25519();
    final signature = await algorithm.sign(
      utf8.encode(queries),
      keyPair: keyPair,
    );

    return Uri.encodeComponent(base64Encode(signature.bytes));
  }

  static (Uint8List, Uint8List, Uint8List) _keyFromPem(String pem) {
    final pemLines = pem
      .split('\n')
      .where((line) => !line.startsWith('-----'))
      .join();
    final privateKey = base64Decode(pemLines);
    final asn1Parser = ASN1Parser(privateKey);
    final asn1Sequence = asn1Parser.nextObject() as ASN1Sequence;
    final modulus = (asn1Sequence.elements[1] as ASN1Integer).valueBytes();
    final publicExponent = (asn1Sequence.elements[2] as ASN1Integer).valueBytes();
    final privateExponent = (asn1Sequence.elements[3] as ASN1Integer).valueBytes();

    return (modulus, publicExponent, privateExponent);
  }
}
