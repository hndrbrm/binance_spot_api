// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

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
mixin BaseError {
  int get code;
  String get message;

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
  };
}
