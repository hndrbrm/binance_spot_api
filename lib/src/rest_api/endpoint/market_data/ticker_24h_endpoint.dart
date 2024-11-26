// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../../../enum/ticker_type.dart';
import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../serializer.dart';

/// 24 hour rolling window price change statistics.
///
/// Careful when accessing this with no symbol.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#24hr-ticker-price-change-statistics
mixin Ticker24hEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/ticker/24hr';
  static const method = HttpMethod.get;

  static int weight(List<String>? symbols) =>
    switch (symbols?.length) {
      null => 80,
      >0 && <=20 => 2,
      >20 && <=100 => 40,
      >100 => 80,
      _ => throw UnsupportedError('Should not happened!'),
    };

  Future<List<Ticker24h>> ticker24h({
    List<String>? symbols,
    TickerType? type,
  }) async {
    final queries = _Parameter(
      symbols: symbols,
      type: type,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    if (json is Map) {
      return [
        Ticker24h.deserialize(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Ticker24h.deserialize(e))
      .toList();
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter({
    this.symbols,
    this.type,
  });

  /// If null, tickers for all symbols will be returned in an array.
  final List<String>? symbols;

  /// If null, the default is [TickerType.full].
  final TickerType? type;

  @override
  Map<String, dynamic> buildQuery() => {
    if (symbols != null && symbols!.length == 1)
    'symbol': symbols![0],
    if (symbols != null && symbols!.length > 1)
    'symbols': jsonEncode(symbols),
    if (type != null)
    'type': type!.serialize(),
  };
}

final class Ticker24h implements Serializer {
  Ticker24h.deserialize(Map<String, dynamic> map)
  : symbol = map[_symbol],
    priceChange = double.tryParse(map[_priceChange]),
    priceChangePercent = double.tryParse(map[_priceChangePercent]),
    weightedAvgPrice = double.tryParse(map[_weightedAvgPrice]),
    prevClosePrice = double.tryParse(map[_prevClosePrice]),
    lastPrice = double.parse(map[_lastPrice]),
    lastQty = double.tryParse(map[_lastQty]),
    bidPrice = double.tryParse(map[_bidPrice]),
    bidQty = double.tryParse(map[_bidQty]),
    askPrice = double.tryParse(map[_askPrice]),
    askQty = double.tryParse(map[_askQty]),
    openPrice = double.parse(map[_openPrice]),
    highPrice = double.parse(map[_highPrice]),
    lowPrice = double.parse(map[_lowPrice]),
    volume = double.parse(map[_volume]),
    quoteVolume = double.parse(map[_quoteVolume]),
    openTime = map[_openTime],
    closeTime = map[_closeTime],
    firstId = map[_firstId],
    lastId = map[_lastId],
    count = map[_count];

  final String symbol;
  final double? priceChange;
  final double? priceChangePercent;
  final double? weightedAvgPrice;
  final double? prevClosePrice;
  final double lastPrice;
  final double? lastQty;
  final double? bidPrice;
  final double? bidQty;
  final double? askPrice;
  final double? askQty;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double volume;
  final double quoteVolume;
  final int openTime;
  final int closeTime;
  final int firstId;
  final int lastId;
  final int count;
  
  static const _symbol = 'symbol';
  static const _priceChange = 'priceChange';
  static const _priceChangePercent = 'priceChangePercent';
  static const _weightedAvgPrice = 'weightedAvgPrice';
  static const _prevClosePrice = 'prevClosePrice';
  static const _lastPrice = 'lastPrice';
  static const _lastQty = 'lastQty';
  static const _bidPrice = 'bidPrice';
  static const _bidQty = 'bidQty';
  static const _askPrice = 'askPrice';
  static const _askQty = 'askQty';
  static const _openPrice = 'openPrice';
  static const _highPrice = 'highPrice';
  static const _lowPrice = 'lowPrice';
  static const _volume = 'volume';
  static const _quoteVolume = 'quoteVolume';
  static const _openTime = 'openTime';
  static const _closeTime = 'closeTime';
  static const _firstId = 'firstId';
  static const _lastId = 'lastId';
  static const _count = 'askQty';
  
  @override
  Map<String, dynamic> serialize() => {
    _symbol: symbol,
    if (priceChange != null)
    _priceChange: '$priceChange',
    if (priceChangePercent != null)
    _priceChangePercent: '$priceChangePercent',
    if (weightedAvgPrice != null)
    _weightedAvgPrice: '$weightedAvgPrice',
    if (prevClosePrice != null)
    _prevClosePrice: '$prevClosePrice',
    _lastPrice: '$lastPrice',
    if (lastQty != null)
    _lastQty: '$lastQty',
    if (bidPrice != null)
    _bidPrice: '$bidPrice',
    if (bidQty != null)
    _bidQty: '$bidQty',
    if (askPrice != null)
    _askPrice: '$askPrice',
    if (askQty != null)
    _askQty: '$askQty',
    _openPrice: '$openPrice',
    _highPrice: '$highPrice',
    _lowPrice: '$lowPrice',
    _volume: '$volume',
    _quoteVolume: '$quoteVolume',
    _openTime: openTime,
    _closeTime: closeTime,
    _firstId: firstId,
    _lastId: lastId,
    _count: count,
  };
}
