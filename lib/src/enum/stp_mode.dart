// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#stp-modes
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#stp-modes
enum StpMode implements Serializer {
  none,
  expireMaker,
  expireTaker,
  expireBoth;

  factory StpMode.deserialize(String string) =>
    switch (string) {
    _none => none,
    _expireMaker => expireMaker,
    _expireTaker => expireTaker,
    _expireBoth => expireBoth,
      _ => throw UnimplementedError(string),
    };

  static const _none = 'NONE';
  static const _expireMaker = 'EXPIRE_MAKER';
  static const _expireTaker = 'EXPIRE_TAKER';
  static const _expireBoth = 'EXPIRE_BOTH';

  @override
  String serialize() =>
    switch (this) {
      none => _none,
      expireMaker => _expireMaker,
      expireTaker => _expireTaker,
      expireBoth => _expireBoth,
    };
}
