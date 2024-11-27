// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../../../enum/permission.dart';
import '../../../enum/rate_limit_interval.dart';
import '../../../enum/rate_limit_type.dart';
import '../../../filter/exchange_filter.dart';
import '../../../filter/filter.dart';
import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../security_type.dart';
import '../../serializer.dart';

/// Current exchange trading rules and symbol information
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#exchange-information
mixin ExchangeInfoEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/exchangeInfo';
  static const method = HttpMethod.get;

  static const weight = 20;

  Future<ExchangeInfo> exchangeInfo({
    List<String>? symbols,
    List<Permission>? permissions,
    bool? showPermissionSets,
    SymbolStatus? symbolStatus,
  }) async {
    final queries = _Parameter(
      symbols: symbols,
      permissions: permissions,
      showPermissionSets: showPermissionSets,
      symbolStatus: symbolStatus,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    return ExchangeInfo.deserialize(json);
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter({
    this.symbols,
    this.permissions,
    this.showPermissionSets,
    this.symbolStatus,
  });

  /// If the value provided to [symbols] do not exist, the endpoint
  /// will throw an error saying the symbol is invalid.
  final List<String>? symbols;

  /// This cannot be used in combination with [symbols].
  ///
  /// If null, all symbols that have either [Permission.spot],
  /// [Permission.margin], or [Permission.leveraged] will be exposed.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#account-and-symbol-permissions
  final List<Permission>? permissions;

  /// Controls whether the content of the permissionSets field is populated
  /// or not.
  ///
  /// Defaults to true
  final bool? showPermissionSets;

  /// Filters symbols that have this tradingStatus.
  ///
  /// Cannot be used in combination with [symbols].
  final SymbolStatus? symbolStatus;

  @override
  Map<String, dynamic> buildQuery() => {
    if (symbols != null && symbols!.length == 1)
    'symbol': symbols![0],
    if (symbols != null && symbols!.length > 1)
    'symbols': jsonEncode(symbols),
    if (permissions != null && permissions!.length == 1)
    'permissions': permissions![0],
    if (permissions != null && permissions!.length > 1)
    'permissions': jsonEncode(permissions!.map((e) => e.serialize()).toList()),
    if (showPermissionSets != null)
    'showPermissionSets': showPermissionSets,
    if (symbolStatus != null)
    'symbolStatus': symbolStatus!.serialize(),
  };
}

final class TickerPrice implements Serializer {
  TickerPrice.deserialize(Map<String, dynamic> json)
  : symbol = json[_symbol],
    price = double.parse(json[_price]);

  final String symbol;
  final double price;

  static const _symbol = 'symbol';
  static const _price = 'price';

  @override
  Map<String, dynamic> serialize() => {
    _symbol: symbol,
    _price: '$price',
  };
}

final class ExchangeInfo implements Serializer {
  ExchangeInfo.deserialize(Map<String, dynamic> map)
  : timezone = map[_timezone],
    serverTime = map[_serverTime],
    limits = (map[_rateLimits] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => RateLimit.deserialize(e))
      .toList(),
    filters = (map[_exchangeFilters] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => ExchangeFilter.deserialize(e))
      .toList(),
    symbols = (map[_symbols] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Symbol.deserialize(e))
      .toList(),
    sors = (map[_sors] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .map((e) => Sor.deserialize(e))
      .toList();

  final String timezone;
  final int serverTime;
  final List<RateLimit> limits;
  final List<ExchangeFilter> filters;
  final List<Symbol> symbols;
  final List<Sor>? sors;

  static const _timezone = 'timezone';
  static const _serverTime = 'serverTime';
  static const _rateLimits = 'rateLimits';
  static const _exchangeFilters = 'exchangeFilters';
  static const _symbols = 'symbols';
  static const _sors = 'sors';

  @override
  Map<String, dynamic> serialize() => {
    _timezone: timezone,
    _serverTime: serverTime,
    _rateLimits: limits.map((e) => e.serialize()).toList(),
    _exchangeFilters: filters.map((e) => e.serialize()).toList(),
    _symbols: symbols.map((e) => e.serialize()).toList(),
    if (sors != null)
    _sors: sors!.map((e) => e.serialize()).toList(),
  };
}

/// An [Interval.fiveMinute] with [value] 5 means "Every 5 minutes".
///
/// Requests fail with [HttpReturnCode.breakingRequestRateLimit] when you
/// exceed the request rate limit.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#general-info-on-limits
final class RateLimit implements Serializer {
  RateLimit.deserialize(Map<String, dynamic> map)
  : type = RateLimitType.deserialize(map[_type]),
    interval = RateLimitInterval.deserialize(map[_interval]),
    value = map[_value],
    limit = map[_limit];

  final RateLimitType type;
  final RateLimitInterval interval;
  final int value;
  final int limit;

  static const _type = 'rateLimitType';
  static const _interval = 'interval';
  static const _value = 'intervalNum';
  static const _limit = 'limit';

  @override
  Map<String, dynamic> serialize() => {
    _type: type.serialize(),
    _interval: interval.serialize(),
    _value: value,
    _limit: limit,
  };
}

final class Symbol implements Serializer {
  Symbol.deserialize(Map<String, dynamic> map)
  : symbol = map[_symbol],
    status = SymbolStatus.deserialize(map[_status]),
    baseAsset = map[_baseAsset],
    baseAssetPrecision = map[_baseAssetPrecision],
    quoteAsset = map[_quoteAsset],
    quotePrecision = map[_quotePrecision],
    quoteAssetPrecision = map[_quoteAssetPrecision],
    baseCommissionPrecision = map[_baseCommissionPrecision],
    quoteCommissionPrecision = map[_quoteCommissionPrecision],
    orderTypes = (map[_orderTypes] as List<dynamic>)
      .map((e) => e as String)
      .map((e) => OrderType.deserialize(e))
      .toList(),
    icebergAllowed = map[_icebergAllowed],
    ocoAllowed = map[_ocoAllowed],
    otoAllowed = map[_otoAllowed],
    quoteOrderQtyMarketAllowed = map[_quoteOrderQtyMarketAllowed],
    allowTrailingStop = map[_allowTrailingStop],
    cancelReplaceAllowed = map[_cancelReplaceAllowed],
    isSpotTradingAllowed = map[_isSpotTradingAllowed],
    isMarginTradingAllowed = map[_isMarginTradingAllowed],
    filters = (map[_filters] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Filter.deserialize(e))
      .toList(),
    permissions = (map[_permissions] as List<dynamic>)
      .map((e) => e as String)
      .map((e) => Permission.deserialize(e))
      .toList(),
    permissionSets = (map[_permissionSets] as List<dynamic>)
      .map((e) => (e as List<dynamic>)
        .map((e) => e as String)
        .map((e) => Permission.deserialize(e))
        .toList())
      .toList(),
    defaultSelfTradePreventionMode = map[_defaultSelfTradePreventionMode],
    allowedSelfTradePreventionModes = (map[_allowedSelfTradePreventionModes] as List<dynamic>)
      .map((e) => e as String)
      .toList();

  final String symbol;
  final SymbolStatus status;
  final String baseAsset;
  final int baseAssetPrecision;
  final String quoteAsset;
  final int quotePrecision;
  final int quoteAssetPrecision;
  final int baseCommissionPrecision;
  final int quoteCommissionPrecision;
  final List<OrderType> orderTypes;
  final bool icebergAllowed;
  final bool ocoAllowed;
  final bool otoAllowed;
  final bool quoteOrderQtyMarketAllowed;
  final bool allowTrailingStop;
  final bool cancelReplaceAllowed;
  final bool isSpotTradingAllowed;
  final bool isMarginTradingAllowed;
  final List<Filter> filters;
  final List<Permission> permissions;
  final List<List<Permission>> permissionSets;
  final String defaultSelfTradePreventionMode;
  final List<String> allowedSelfTradePreventionModes;

  static const _symbol = 'symbol';
  static const _status = 'status';
  static const _baseAsset = 'baseAsset';
  static const _baseAssetPrecision = 'baseAssetPrecision';
  static const _quoteAsset = 'quoteAsset';
  static const _quotePrecision = 'quotePrecision';
  static const _quoteAssetPrecision = 'quoteAssetPrecision';
  static const _baseCommissionPrecision = 'baseCommissionPrecision';
  static const _quoteCommissionPrecision = 'quoteCommissionPrecision';
  static const _orderTypes = 'orderTypes';
  static const _icebergAllowed = 'icebergAllowed';
  static const _ocoAllowed = 'ocoAllowed';
  static const _otoAllowed = 'otoAllowed';
  static const _quoteOrderQtyMarketAllowed = 'quoteOrderQtyMarketAllowed';
  static const _allowTrailingStop = 'allowTrailingStop';
  static const _cancelReplaceAllowed = 'cancelReplaceAllowed';
  static const _isSpotTradingAllowed = 'isSpotTradingAllowed';
  static const _isMarginTradingAllowed = 'isMarginTradingAllowed';
  static const _filters = 'filters';
  static const _permissions = 'permissions';
  static const _permissionSets = 'permissionSets';
  static const _defaultSelfTradePreventionMode = 'defaultSelfTradePreventionMode';
  static const _allowedSelfTradePreventionModes = 'allowedSelfTradePreventionModes';

  @override
  Map<String, dynamic> serialize() => {
    _symbol: symbol,
    _status: status.serialize(),
    _baseAsset: baseAsset,
    _baseAssetPrecision: baseAssetPrecision,
    _quoteAsset: quoteAsset,
    _quotePrecision: quotePrecision,
    _quoteAssetPrecision: quoteAssetPrecision,
    _baseCommissionPrecision: baseCommissionPrecision,
    _quoteCommissionPrecision: quoteCommissionPrecision,
    _orderTypes: orderTypes.map((e) => e.serialize()).toList(),
    _icebergAllowed: icebergAllowed,
    _ocoAllowed: ocoAllowed,
    _otoAllowed: otoAllowed,
    _quoteOrderQtyMarketAllowed: quoteOrderQtyMarketAllowed,
    _allowTrailingStop: allowTrailingStop,
    _cancelReplaceAllowed: cancelReplaceAllowed,
    _isSpotTradingAllowed: isSpotTradingAllowed,
    _isMarginTradingAllowed: isMarginTradingAllowed,
    _filters: filters.map((e) => e.serialize()).toList(),
    _permissions: permissions.map((e) => e.serialize()).toList(),
    _permissionSets: permissionSets
      .map((e) => e.map((e) => e.serialize()).toList())
      .toList(),
    _defaultSelfTradePreventionMode: defaultSelfTradePreventionMode,
    _allowedSelfTradePreventionModes: allowedSelfTradePreventionModes,
  };
}

enum SymbolStatus implements Serializer {
  trading,
  halt,
  theBreak;

  factory SymbolStatus.deserialize(String string) =>
    switch (string) {
      _trading => trading,
      _halt => halt,
      _break => theBreak,
      _ => throw UnimplementedError(string),
    };

  static const _trading = 'TRADING';
  static const _halt = 'HALT';
  static const _break = 'BREAK';

  @override
  String serialize() =>
    switch (this) {
      trading => _trading,
      halt => _halt,
      theBreak => _break,
    };
}

enum OrderType implements Serializer {
  limit,
  limitMarker,
  market,
  stopLoss,
  stopLossLimit,
  takeProfit,
  takeProfitLimit;

  factory OrderType.deserialize(String string) =>
    switch (string) {
      _limit => limit,
      _limitMaker => limitMarker,
      _market => market,
      _stopLoss => stopLoss,
      _stopLossLimit => stopLossLimit,
      _takeProfit => takeProfit,
      _takeProfitLimit => takeProfitLimit,
      _ => throw UnimplementedError(string),
    };

  static const _limit = 'LIMIT';
  static const _limitMaker = 'LIMIT_MAKER';
  static const _market = 'MARKET';
  static const _stopLoss = 'STOP_LOSS';
  static const _stopLossLimit = 'STOP_LOSS_LIMIT';
  static const _takeProfit = 'TAKE_PROFIT';
  static const _takeProfitLimit = 'TAKE_PROFIT_LIMIT';

  @override
  String serialize() =>
    switch (this) {
      limit => _limit,
      limitMarker => _limitMaker,
      market => _market,
      stopLoss => _stopLoss,
      stopLossLimit => _stopLossLimit,
      takeProfit => _takeProfit,
      takeProfitLimit => _takeProfitLimit,
    };
}

final class Sor implements Serializer {
  Sor.deserialize(Map<String, dynamic> map)
  : baseAsset = map[_baseAsset],
    symbols = map[_symbols];

  final String baseAsset;
  final List<String> symbols;

  static const _baseAsset = 'baseAsset';
  static const _symbols = 'symbols';

  @override
  Map<String, dynamic> serialize() => {
    _baseAsset: baseAsset,
    _symbols: symbols,
  };
}
