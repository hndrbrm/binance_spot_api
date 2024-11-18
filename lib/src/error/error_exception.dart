// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:binance_spot_api/src/error/request_issue.dart';

import 'network_error.dart';

/// Errors consist of two parts: an error code and a message.
/// Codes are universal, but messages can vary.
///
/// Example:
/// {
///   "code":-1121,
///   "msg":"Invalid symbol."
/// }
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md
final class ErrorException implements Exception {
  ErrorException.fromJson(Map<String, dynamic> json)
  : code = ErrorCode.parse(json['code']),
    message = json['msg'];

  final ErrorCode code;
  final String message;

  Map<String, dynamic> toJson() => {
    'code': code.value,
    'msg': message,
  };

  @override
  String toString() => 'Error (${code.value}): $message';
}

abstract class ErrorCode {
  int get value;

  static ErrorCode parse(int code) =>
    switch (code) {
      <=-1000 && >-1100 => NetworkIssue.parse(code),
      <=-1100 && >-1200 => RequestIssue.parse(code),
      _ => throw UnimplementedError('$code'),
    };
}
