// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#order-side-side
enum OrderSide implements Serializer {
  buy,
  sell;

  factory OrderSide.deserialize(String string) =>
    switch (string) {
      _buy => buy,
      _sell => sell,
      _ => throw UnimplementedError(string),
    };

  static const _buy = 'BUY';
  static const _sell = 'SELL';

  @override
  String serialize() =>
    switch (this) {
      buy => _buy,
      sell => _sell,
    };
}
