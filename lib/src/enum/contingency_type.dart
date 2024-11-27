// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#contingencytype
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#contingencytype
enum ContingencyType implements Serializer {
  oco,
  oto;

  factory ContingencyType.deserialize(String string) =>
    switch (string) {
      _oco => oco,
      _oto => oto,
      _ => throw UnimplementedError(string),
    };

  static const _oco = 'OCO';
  static const _oto = 'OTO';

  @override
  String serialize() =>
    switch (this) {
      oco => _oco,
      oto => _oto,
    };
}
