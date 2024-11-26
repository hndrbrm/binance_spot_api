// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.



/// References:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#http-return-codes
enum HttpReturnCode {
  ok,

  /// HTTP 4XX return codes are used for malformed requests;
  /// the issue is on the sender's side.
  malformedRequest,

  /// HTTP 403 return code is used when the WAF Limit
  /// (Web Application Firewall) has been violated.
  wafLimitViolated,

  /// HTTP 409 return code is used when a cancelReplace order partially
  /// succeeds. (i.e. if the cancellation of the order fails but the new order
  /// placement succeeds.)
  cancelReplacePartialSucceed,

  /// HTTP 429 return code is used when breaking a request rate limit.
  breakingRequestRateLimit,

  /// HTTP 418 return code is used when an IP has been auto-banned for
  /// continuing to send requests after receiving 429 codes.
  ipAutoBanned,

  /// HTTP 5XX return codes are used for internal errors; the issue is on
  /// Binance's side. It is important to NOT treat this as a failure operation;
  /// the execution status is UNKNOWN and could have been a success.
  internalError;

  static HttpReturnCode parse(int code) =>
    switch (code) {
      200 => ok,
      403 => wafLimitViolated,
      409 => cancelReplacePartialSucceed,
      418 => ipAutoBanned,
      429 => breakingRequestRateLimit,
      >=400 && <500 => malformedRequest,
      >=500 && <600 => internalError,
      _ => throw UnimplementedError('$code'),
    };
}
