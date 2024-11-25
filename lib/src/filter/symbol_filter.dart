// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'filter.dart';
import 'filter_type.dart';
import 'symbol_filter_type.dart';

abstract class SymbolFilter implements Filter {
  factory SymbolFilter.deserialize(Map<String, dynamic> map) =>
    switch (SymbolFilterType.deserialize(map[FilterType.value])) {
      SymbolFilterType.priceFilter => PriceFilter.deserialize(map),
      SymbolFilterType.percentPrice => PercentPrice.deserialize(map),
      SymbolFilterType.percentPriceBySide => PercentPriceBySide.deserialize(map),
      SymbolFilterType.lotSize => LotSize.deserialize(map),
      SymbolFilterType.minNotional => MinNotional.deserialize(map),
      SymbolFilterType.notional => Notional.deserialize(map),
      SymbolFilterType.icebergParts => IcebergParts.deserialize(map),
      SymbolFilterType.marketLotSize => MarketLotSize.deserialize(map),
      SymbolFilterType.maxNumOrders => MaxNumOrders.deserialize(map),
      SymbolFilterType.maxNumAlgoOrders => MaxNumAlgoOrders.deserialize(map),
      SymbolFilterType.maxNumIcebergOrders => MaxNumIcebergOrders.deserialize(map),
      SymbolFilterType.maxPosition => MaxPosition.deserialize(map),
      SymbolFilterType.trailingDelta => TrailingDelta.deserialize(map),
    };

  @override
  SymbolFilterType get type;
}

/// The price rules for a symbol.
///
/// There are 3 parts:
/// * [minPrice] defines the minimum price/stopPrice allowed;
///   disabled on [minPrice] == 0.
/// * [maxPrice] defines the maximum price/stopPrice allowed;
///   disabled on [maxPrice] == 0.
/// * [tickSize] defines the intervals that a price/stopPrice can be
///   increased/decreased by; disabled on [tickSize] == 0.
///
/// Any of the above variables can be set to 0, which disables that rule in
/// the price filter. In order to pass the price filter, the following must be
/// true for price/stopPrice of the enabled rules:
/// * price >= [minPrice]
/// * price <= [maxPrice]
/// * price % [tickSize] == 0
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#price_filter
final class PriceFilter implements SymbolFilter {
  PriceFilter.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.priceFilter,
    minPrice = double.parse(map[_minPrice]),
    maxPrice = double.parse(map[_maxPrice]),
    tickSize = double.parse(map[_tickSize]);

  @override
  final SymbolFilterType type;

  final double minPrice;
  final double maxPrice;
  final double tickSize;

  static const _minPrice = 'minPrice';
  static const _maxPrice = 'maxPrice';
  static const _tickSize = 'tickSize';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minPrice: '$minPrice',
    _maxPrice: '$maxPrice',
    _tickSize: '$tickSize',
  };
}

/// The valid range for the price based on the average of the previous trades.
///
/// [avgPriceMins] is the number of minutes the average price is calculated
/// over. 0 means the last price is used.
///
/// In order to pass the percent price, the following must be true for price:
/// price <= weightedAveragePrice * [multiplierUp]
/// price >= weightedAveragePrice * [multiplierDown]
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#percent_price
final class PercentPrice implements SymbolFilter {
  PercentPrice.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.percentPrice,
    multiplierUp = map[_multiplierUp],
    multiplierDown = map[_multiplierDown],
    avgPriceMins = map[_avgPriceMins];

  @override
  final SymbolFilterType type;

  final double multiplierUp;
  final double multiplierDown;
  final int avgPriceMins;

  static const _multiplierUp = 'multiplierUp';
  static const _multiplierDown = 'multiplierDown';
  static const _avgPriceMins = 'avgPriceMins';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _multiplierUp: multiplierUp,
    _multiplierDown: multiplierDown,
    _avgPriceMins: avgPriceMins,
  };
}

/// Defines the valid range for the price based on the average of the previous
/// trades.
///
/// [avgPriceMins] is the number of minutes the average price is calculated
/// over. 0 means the last price is used.
///
/// There is a different range depending on whether the order is placed on
/// the BUY side or the SELL side.
///
/// Buy orders will succeed on this filter if:
/// * Order price <= weightedAveragePrice * [bidMultiplierUp]
/// * Order price >= weightedAveragePrice * [bidMultiplierDown]
///
/// Sell orders will succeed on this filter if:
/// * Order Price <= weightedAveragePrice * [askMultiplierUp]
/// * Order Price >= weightedAveragePrice * [askMultiplierDown]
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#percent_price_by_side
final class PercentPriceBySide implements SymbolFilter {
  PercentPriceBySide.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.percentPriceBySide,
    bidMultiplierUp = double.parse(map[_bidMultiplierUp]),
    bidMultiplierDown = double.parse(map[_bidMultiplierDown]),
    askMultiplierUp = double.parse(map[_askMultiplierUp]),
    askMultiplierDown = double.parse(map[_askMultiplierDown]),
    avgPriceMins = map[_avgPriceMins];

  @override
  final SymbolFilterType type;

  final double bidMultiplierUp;
  final double bidMultiplierDown;
  final double askMultiplierUp;
  final double askMultiplierDown;
  final int avgPriceMins;

  static const _bidMultiplierUp = 'bidMultiplierUp';
  static const _bidMultiplierDown = 'bidMultiplierDown';
  static const _askMultiplierUp = 'askMultiplierUp';
  static const _askMultiplierDown = 'askMultiplierDown';
  static const _avgPriceMins = 'avgPriceMins';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _bidMultiplierUp: '$bidMultiplierUp',
    _bidMultiplierDown: '$bidMultiplierDown',
    _askMultiplierUp: '$askMultiplierUp',
    _askMultiplierDown: '$askMultiplierDown',
    _avgPriceMins: avgPriceMins,
  };
}

/// The quantity (aka "lots" in auction terms) rules for a symbol.
///
/// There are 3 parts:
/// * [minQty] defines the minimum quantity/icebergQty allowed.
/// * [maxQty] defines the maximum quantity/icebergQty allowed.
/// * [stepSize] defines the intervals that a quantity/icebergQty can be
///   increased/decreased by.
///
/// In order to pass the lot size, the following must be true for
/// quantity/icebergQty:
/// * quantity >= [minQty]
/// * quantity <= [maxQty]
/// * quantity % [stepSize] == 0
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#lot_size
final class LotSize implements SymbolFilter {
  LotSize.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.lotSize,
    minQty = double.parse(map[_minQty]),
    maxQty = double.parse(map[_maxQty]),
    stepSize = double.parse(map[_stepSize]);

  @override
  final SymbolFilterType type;

  final double minQty;
  final double maxQty;
  final double stepSize;

  static const _minQty = 'minQty';
  static const _maxQty = 'maxQty';
  static const _stepSize = 'stepSize';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minQty: '$minQty',
    _maxQty: '$maxQty',
    _stepSize: '$stepSize',
  };
}

/// The minimum notional value allowed for an order on a symbol.
///
/// An order's notional value is the price * quantity.
///
/// [applyToMarket] determines whether or not the [MinNotional] filter will
/// also be applied to MARKET orders. Since MARKET orders have no price,
/// the average price is used over the last [avgPriceMins] minutes.
///
/// [avgPriceMins] is the number of minutes the average price is calculated
/// over. 0 means the last price is used.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#min_notional
final class MinNotional implements SymbolFilter {
  MinNotional.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.minNotional,
    minNotional = map[_minNotional],
    applyToMarket = map[_applyToMarket],
    avgPriceMins = map[_avgPriceMins];

  @override
  final SymbolFilterType type;

  final double minNotional;
  final bool applyToMarket;
  final int avgPriceMins;

  static const _minNotional = 'minNotional';
  static const _applyToMarket = 'applyToMarket';
  static const _avgPriceMins = 'avgPriceMins';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minNotional: minNotional,
    _applyToMarket: applyToMarket,
    _avgPriceMins: avgPriceMins,
  };
}

/// The acceptable notional range allowed for an order on a symbol.
///
/// [applyMinToMarket] determines whether the [minNotional] will be applied to
/// MARKET orders.
///
/// [applyMaxToMarket] determines whether the [maxNotional] will be applied to
/// MARKET orders.
///
/// In order to pass this filter, the notional (price * quantity) has to pass
/// the following conditions:
/// * price * quantity <= [maxNotional]
/// * price * quantity >= [minNotional]
///
/// For MARKET orders, the average price used over the last [avgPriceMins]
/// minutes will be used for calculation.
///
/// If the [avgPriceMins] is 0, then the last price will be used.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#notional
final class Notional implements SymbolFilter {
  Notional.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.notional,
    minNotional = double.parse(map[_minNotional]),
    applyMinToMarket = map[_applyMinToMarket],
    maxNotional = double.parse(map[_maxNotional]),
    applyMaxToMarket = map[_applyMaxToMarket],
    avgPriceMins = map[_avgPriceMins];

  @override
  final SymbolFilterType type;

  final double minNotional;
  final bool applyMinToMarket;
  final double maxNotional;
  final bool applyMaxToMarket;
  final int avgPriceMins;

  static const _minNotional = 'minNotional';
  static const _applyMinToMarket = 'applyMinToMarket';
  static const _maxNotional = 'maxNotional';
  static const _applyMaxToMarket = 'applyMaxToMarket';
  static const _avgPriceMins = 'avgPriceMins';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minNotional: '$minNotional',
    _applyMinToMarket: applyMinToMarket,
    _maxNotional: '$maxNotional',
    _applyMaxToMarket: applyMaxToMarket,
    _avgPriceMins: avgPriceMins,
  };
}

/// The maximum parts an iceberg order can have.
///
/// The number of ICEBERG_PARTS is defined as CEIL(qty / icebergQty).
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#iceberg_parts
final class IcebergParts implements SymbolFilter {
  IcebergParts.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.icebergParts,
    limit = map[_limit];

  @override
  final SymbolFilterType type;

  final int limit;

  static const _limit = 'limit';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _limit: limit,
  };
}

/// The quantity (aka "lots" in auction terms) rules for MARKET orders on
/// a symbol.
///
/// There are 3 parts:
/// * [minQty] defines the minimum quantity allowed.
/// * [maxQty] defines the maximum quantity allowed.
/// * [stepSize] defines the intervals that a quantity can be
///   increased/decreased by.
///
/// In order to pass the market lot size, the following must be true for
/// quantity:
/// * quantity >= [minQty]
/// * quantity <= [maxQty]
/// * quantity % [stepSize] == 0
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#market_lot_size
final class MarketLotSize implements SymbolFilter {
  MarketLotSize.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.marketLotSize,
    minQty = double.parse(map[_minQty]),
    maxQty = double.parse(map[_maxQty]),
    stepSize = double.parse(map[_stepSize]);

  @override
  final SymbolFilterType type;

  final double minQty;
  final double maxQty;
  final double stepSize;

  static const _minQty = 'minQty';
  static const _maxQty = 'maxQty';
  static const _stepSize = 'stepSize';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minQty: '$minQty',
    _maxQty: '$maxQty',
    _stepSize: '$stepSize',
  };
}

/// The maximum number of orders an account is allowed to have open on a symbol.
///
/// Note that both "algo" orders and normal orders are counted for this filter.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_orders
final class MaxNumOrders implements SymbolFilter {
  MaxNumOrders.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.maxNumOrders,
    maxNumOrders = map[_maxNumOrders];

  @override
  final SymbolFilterType type;

  final int maxNumOrders;

  static const _maxNumOrders = 'maxNumOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumOrders: maxNumOrders,
  };
}

/// The maximum number of "algo" orders an account is allowed to have open on
/// a symbol.
///
/// "Algo" orders are STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, and
/// TAKE_PROFIT_LIMIT orders.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_algo_orders
final class MaxNumAlgoOrders implements SymbolFilter {
  MaxNumAlgoOrders.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.maxNumAlgoOrders,
    maxNumAlgoOrders = map[_maxNumAlgoOrders];

  @override
  final SymbolFilterType type;

  final int maxNumAlgoOrders;

  static const _maxNumAlgoOrders = 'maxNumAlgoOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumAlgoOrders: maxNumAlgoOrders,
  };
}

/// The maximum number of ICEBERG orders an account is allowed to have open
/// on a symbol. An ICEBERG order is any order where the icebergQty is > 0.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_num_iceberg_orders
final class MaxNumIcebergOrders implements SymbolFilter {
  MaxNumIcebergOrders.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.maxNumIcebergOrders,
    maxNumIcebergOrders = map[_maxNumIcebergOrders];

  @override
  final SymbolFilterType type;

  final int maxNumIcebergOrders;

  static const _maxNumIcebergOrders = 'maxNumIcebergOrders';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxNumIcebergOrders: maxNumIcebergOrders,
  };
}

/// The allowed maximum position an account can have on the base asset of
/// a symbol.
///
/// An account's position defined as the sum of the account's:
/// 1. free balance of the base asset
/// 2. locked balance of the base asset
/// 3. sum of the qty of all open BUY orders
///
/// BUY orders will be rejected if the account's position is greater than
/// the maximum position allowed.
///
/// If an order's quantity can cause the position to overflow, this will
/// also fail the MAX_POSITION filter.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#max_position
final class MaxPosition implements SymbolFilter {
  MaxPosition.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.maxPosition,
    maxPosition = map[_maxPosition];

  @override
  final SymbolFilterType type;

  final double maxPosition;

  static const _maxPosition = 'maxPosition';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _maxPosition: maxPosition,
  };
}

/// The minimum and maximum value for the parameter trailingDelta.
///
/// In order for a trailing stop order to pass this filter, the following
/// must be true:
///
/// For STOP_LOSS BUY, STOP_LOSS_LIMIT_BUY,TAKE_PROFIT SELL and
/// TAKE_PROFIT_LIMIT SELL orders:
/// * trailingDelta >= [minTrailingAboveDelta]
/// * trailingDelta <= [maxTrailingAboveDelta]
///
/// For STOP_LOSS SELL, STOP_LOSS_LIMIT SELL, TAKE_PROFIT BUY, and
/// TAKE_PROFIT_LIMIT BUY orders:
/// * trailingDelta >= [minTrailingBelowDelta]
/// * trailingDelta <= [maxTrailingBelowDelta]
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/filters.md#trailing_delta
final class TrailingDelta implements SymbolFilter {
  TrailingDelta.deserialize(Map<String, dynamic> map)
  : type = SymbolFilterType.trailingDelta,
    minTrailingAboveDelta = map[_minTrailingAboveDelta],
    maxTrailingAboveDelta = map[_maxTrailingAboveDelta],
    minTrailingBelowDelta = map[_minTrailingBelowDelta],
    maxTrailingBelowDelta = map[_maxTrailingBelowDelta];

  @override
  final SymbolFilterType type;

  final int minTrailingAboveDelta;
  final int maxTrailingAboveDelta;
  final int minTrailingBelowDelta;
  final int maxTrailingBelowDelta;

  static const _minTrailingAboveDelta = 'minTrailingAboveDelta';
  static const _maxTrailingAboveDelta = 'maxTrailingAboveDelta';
  static const _minTrailingBelowDelta = 'minTrailingBelowDelta';
  static const _maxTrailingBelowDelta = 'maxTrailingBelowDelta';

  @override
  Map<String, dynamic> serialize() => {
    FilterType.value: type.serialize(),
    _minTrailingAboveDelta: minTrailingAboveDelta,
    _maxTrailingAboveDelta: maxTrailingAboveDelta,
    _minTrailingBelowDelta: minTrailingBelowDelta,
    _maxTrailingBelowDelta: maxTrailingBelowDelta,
  };
}
