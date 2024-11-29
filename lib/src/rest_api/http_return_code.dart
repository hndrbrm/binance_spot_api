// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#http-return-codes
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/rest-api.md#http-return-codes
sealed class HttpReturnCode implements Serializer {
  const HttpReturnCode();

  factory HttpReturnCode.deserialize(int code) =>
    switch (code) {
      Ok.value => const Ok(),
      WafLimitViolated.value => const WafLimitViolated(),
      CancelReplacePartialSucceed.value => const CancelReplacePartialSucceed(),
      IpAutoBanned.value => const IpAutoBanned(),
      >=400 && <500 => MalformedRequest(code),
      >=500 && <600 => InternalError(code),
      _ => throw UnimplementedError('$code'),
    };
}

final class Ok extends HttpReturnCode {
  const Ok();

  static const int value = 200;

  @override
  int serialize() => value;
}

/// HTTP 403 return code is used when the WAF Limit
/// (Web Application Firewall) has been violated.
final class WafLimitViolated extends HttpReturnCode {
  const WafLimitViolated();

  static const int value = 403;

  @override
  int serialize() => value;
}

/// HTTP 409 return code is used when a cancelReplace order partially
/// succeeds. (i.e. if the cancellation of the order fails but the new order
/// placement succeeds.)
final class CancelReplacePartialSucceed extends HttpReturnCode {
  const CancelReplacePartialSucceed();

  static const int value = 409;

  @override
  int serialize() => value;
}

/// HTTP 418 return code is used when an IP has been auto-banned for
/// continuing to send requests after receiving 429 codes.
final class IpAutoBanned extends HttpReturnCode {
  const IpAutoBanned();

  static const int value = 418;

  @override
  int serialize() => value;
}

/// HTTP 429 return code is used when breaking a request rate limit.
final class BreakingRequestRateLimit extends HttpReturnCode {
  const BreakingRequestRateLimit();

  static const int value = 429;

  @override
  int serialize() => value;
}

/// HTTP 4XX return codes are used for malformed requests;
/// the issue is on the sender's side.
final class MalformedRequest extends HttpReturnCode {
  const MalformedRequest(this._value)
  : assert(400 <= _value && _value < 500);

  final int _value;

  @override
  int serialize() => _value;
}

/// HTTP 5XX return codes are used for internal errors; the issue is on
/// Binance's side. It is important to NOT treat this as a failure operation;
/// the execution status is UNKNOWN and could have been a success.
final class InternalError extends HttpReturnCode {
  const InternalError(this._value)
  : assert(500 <= _value && _value < 600);

  final int _value;

  @override
  int serialize() => _value;
}
