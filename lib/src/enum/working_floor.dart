// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#working-floor
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#working-floor
enum WorkingFloor implements Serializer {
  exchange,
  sor;

  factory WorkingFloor.deserialize(String string) =>
    switch (string) {
      _exchange => exchange,
      _sor => sor,
      _ => throw UnimplementedError(string),
    };

  static const _exchange = 'EXCHANGE';
  static const _sor = 'SOR';

  @override
  String serialize() =>
    switch (this) {
      exchange => _exchange,
      sor => _sor,
    };
}
