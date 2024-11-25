// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'filter_type.dart';

/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange-filters
enum ExchangeFilterType implements FilterType {
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_orders
  exchangeMaxNumOrders,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_algo_orders
  exchangeMaxNumAlgoOrders,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_iceberg_orders
  exchangeMaxNumIcebergOrders;

  static const _exchangeMaxNumOrders = 'EXCHANGE_MAX_NUM_ORDERS';
  static const _exchangeMaxNumAlgoOrders = 'EXCHANGE_MAX_NUM_ALGO_ORDERS';
  static const _exchangeMaxNumIcebergOrders = 'EXCHANGE_MAX_NUM_ICEBERG_ORDERS';

  factory ExchangeFilterType.deserialize(String string) =>
    switch (string) {
      _exchangeMaxNumOrders => exchangeMaxNumOrders,
      _exchangeMaxNumAlgoOrders => exchangeMaxNumAlgoOrders,
      _exchangeMaxNumIcebergOrders => exchangeMaxNumIcebergOrders,
      _ => throw NotExchangeFilterType(string),
    };

  @override
  String serialize() =>
    switch (this) {
      exchangeMaxNumOrders => _exchangeMaxNumOrders,
      exchangeMaxNumAlgoOrders => _exchangeMaxNumAlgoOrders,
      exchangeMaxNumIcebergOrders => _exchangeMaxNumIcebergOrders,
    };
}

final class NotExchangeFilterType implements Exception {
  const NotExchangeFilterType(this.type);

  final String type;

  @override
  String toString() {
    return "Type '$type' are not Exchange Filter Type.";
  }
}
