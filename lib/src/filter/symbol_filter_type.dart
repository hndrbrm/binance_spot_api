// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'filter_type.dart';

/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#symbol-filters
enum SymbolFilterType implements FilterType {
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#price_filter
  priceFilter,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#percent_price
  percentPrice,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#percent_price_by_side
  percentPriceBySide,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#lot_size
  lotSize,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#min_notional
  minNotional,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#notional
  notional,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#iceberg_parts
  icebergParts,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#market_lot_size
  marketLotSize,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_orders
  maxNumOrders,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_algo_orders
  maxNumAlgoOrders,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_iceberg_orders
  maxNumIcebergOrders,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_position
  maxPosition,

  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#trailing_delta
  trailingDelta;

  static const _priceFilter = 'PRICE_FILTER';
  static const _percentPrice = 'PERCENT_PRICE';
  static const _percentPriceBySide = 'PERCENT_PRICE_BY_SIDE';
  static const _lotSize = 'LOT_SIZE';
  static const _minNotional = 'MIN_NOTIONAL';
  static const _notional = 'NOTIONAL';
  static const _icebergParts = 'ICEBERG_PARTS';
  static const _marketLotSize = 'MARKET_LOT_SIZE';
  static const _maxNumOrders = 'MAX_NUM_ORDERS';
  static const _maxNumAlgoOrders = 'MAX_NUM_ALGO_ORDERS';
  static const _maxNumIcebergOrders = 'MAX_NUM_ICEBERG_ORDERS';
  static const _maxPosition = 'MAX_POSITION';
  static const _trailingDelta = 'TRAILING_DELTA';

  factory SymbolFilterType.deserialize(String string) =>
    switch (string) {
      _priceFilter => priceFilter,
      _percentPrice => percentPrice,
      _percentPriceBySide => percentPriceBySide,
      _lotSize => lotSize,
      _minNotional => minNotional,
      _notional => notional,
      _icebergParts => icebergParts,
      _marketLotSize => marketLotSize,
      _maxNumOrders => maxNumOrders,
      _maxNumAlgoOrders => maxNumAlgoOrders,
      _maxNumIcebergOrders => maxNumIcebergOrders,
      _maxPosition => maxPosition,
      _trailingDelta => trailingDelta,
      _ => throw NotSymbolFilterType(string),
    };

  @override
  String serialize() =>
    switch (this) {
      priceFilter => _priceFilter,
      percentPrice => _percentPrice,
      percentPriceBySide => _percentPriceBySide,
      lotSize => _lotSize,
      minNotional => _minNotional,
      notional => _notional,
      icebergParts => _icebergParts,
      marketLotSize => _marketLotSize,
      maxNumOrders => _maxNumOrders,
      maxNumAlgoOrders => _maxNumAlgoOrders,
      maxNumIcebergOrders => _maxNumIcebergOrders,
      maxPosition => _maxPosition,
      trailingDelta => _trailingDelta,
    };
}

final class NotSymbolFilterType implements Exception {
  const NotSymbolFilterType(this.type);

  final String type;

  @override
  String toString() {
    return "Type '$type' are not Symbol Filter Type.";
  }
}
