// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';
import 'network_issue.dart';
import 'other_issue.dart';
import 'request_issue.dart';

/// Any endpoint can return an ERROR.
///
/// Errors consist of two parts: an error [code] and a [message].
/// [code]s are universal, but [message]s can vary.
///
/// Example:
/// {
///   "code":-1121,
///   "msg":"Invalid symbol."
/// }
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md
final class ErrorException implements Exception, Serializer {
  ErrorException.deserialize(Map<String, dynamic> map)
  : code = ErrorCode.parse(map['code']),
    message = map['msg'];

  final ErrorCode code;
  final String message;

  @override
  Map<String, dynamic> serialize() => {
    'code': code.serialize(),
    'msg': message,
  };

  @override
  String toString() => 'Error (${code.serialize()}): $message';
}

abstract class ErrorCode implements Serializer {
  static ErrorCode parse(int code) =>
    switch (code) {
      <=-1000 && >-1100 => NetworkIssue.deserialize(code),
      <=-1100 && >-1200 => RequestIssue.deserialize(code),
      <=-2000 && >-2100 => OtherIssue.deserialize(code),
      _ => throw UnimplementedError('$code'),
    };
}
