// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'exchange_filter_type.dart';
import 'filter.dart';
import 'filter_type.dart';

abstract class ExchangeFilter implements Filter {
  factory ExchangeFilter.deserialize(Map<String, dynamic> map) =>
    switch (ExchangeFilterType.deserialize(map[FilterType.value])) {
      ExchangeFilterType.exchangeMaxNumOrders => ExchangeMaxNumOrders.deserialize(map),
      ExchangeFilterType.exchangeMaxNumAlgoOrders => ExchangeMaxNumAlgoOrders.deserialize(map),
      ExchangeFilterType.exchangeMaxNumIcebergOrders => ExchangeMaxNumIcebergOrders.deserialize(map),
    };

  ExchangeFilterType get type;
}

/// The [ExchangeFilterType.exchangeMaxNumOrders] filter defines the maximum
/// number of orders an account is allowed to have open on the exchange.
/// Note that both "algo" orders and normal orders are counted for this filter.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_orders
final class ExchangeMaxNumOrders implements ExchangeFilter {
  ExchangeMaxNumOrders.deserialize(Map<String, dynamic> map)
  : type = ExchangeFilterType.exchangeMaxNumOrders,
    maxNumOrders = map[_maxNumOrders];

  @override
  final ExchangeFilterType type;

  final int maxNumOrders;

  static const _maxNumOrders = 'maxNumOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumOrders: maxNumOrders,
  };
}

/// The [ExchangeFilterType.exchangeMaxNumAlgoOrders] filter defines the
/// maximum number of "algo" orders an account is allowed to have open on
/// the exchange. "Algo" orders are STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT,
/// and TAKE_PROFIT_LIMIT orders.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_algo_orders
final class ExchangeMaxNumAlgoOrders implements ExchangeFilter {
  ExchangeMaxNumAlgoOrders.deserialize(Map<String, dynamic> map)
  : type = ExchangeFilterType.exchangeMaxNumAlgoOrders,
    maxNumAlgoOrders = map[_maxNumAlgoOrders];

  @override
  final ExchangeFilterType type;

  final int maxNumAlgoOrders;

  static const _maxNumAlgoOrders = 'maxNumAlgoOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumAlgoOrders: maxNumAlgoOrders,
  };
}

/// The [ExchangeFilterType.exchangeMaxNumIcebergOrders] filter defines the
/// maximum number of iceberg orders an account is allowed to have open on the
/// exchange.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#exchange_max_num_iceberg_orders
final class ExchangeMaxNumIcebergOrders implements ExchangeFilter {
  ExchangeMaxNumIcebergOrders.deserialize(Map<String, dynamic> map)
  : type = ExchangeFilterType.exchangeMaxNumIcebergOrders,
    maxNumIcebergOrders = map[_maxNumIcebergOrders];

  @override
  final ExchangeFilterType type;

  final int maxNumIcebergOrders;

  static const _maxNumIcebergOrders = 'maxNumIcebergOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumIcebergOrders: maxNumIcebergOrders,
  };
}
