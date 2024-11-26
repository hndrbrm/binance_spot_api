// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../../enum/ticker_type.dart';
import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../query_builder.dart';

/// 24 hour rolling window price change statistics. Careful when accessing
/// this with no symbol.
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
        Ticker24h.fromJson(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Ticker24h.fromJson(e))
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

final class Ticker24h {
  Ticker24h.fromJson(Map<String, dynamic> json)
  : symbol = json['symbol'],
    priceChange = double.tryParse(json['priceChange']),
    priceChangePercent = double.tryParse(json['priceChangePercent']),
    weightedAvgPrice = double.tryParse(json['weightedAvgPrice']),
    prevClosePrice = double.tryParse(json['prevClosePrice']),
    lastPrice = double.parse(json['lastPrice']),
    lastQty = double.tryParse(json['lastQty']),
    bidPrice = double.tryParse(json['bidPrice']),
    bidQty = double.tryParse(json['bidQty']),
    askPrice = double.tryParse(json['askPrice']),
    askQty = double.tryParse(json['askQty']),
    openPrice = double.parse(json['openPrice']),
    highPrice = double.parse(json['highPrice']),
    lowPrice = double.parse(json['lowPrice']),
    volume = double.parse(json['volume']),
    quoteVolume = double.parse(json['quoteVolume']),
    openTime = json['openTime'],
    closeTime = json['closeTime'],
    firstId = json['firstId'],
    lastId = json['lastId'],
    count = json['count'];

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

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    if (priceChange != null)
    'priceChange': '$priceChange',
    if (priceChangePercent != null)
    'priceChangePercent': '$priceChangePercent',
    if (weightedAvgPrice != null)
    'weightedAvgPrice': '$weightedAvgPrice',
    if (prevClosePrice != null)
    'prevClosePrice': '$prevClosePrice',
    'lastPrice': '$lastPrice',
    if (lastQty != null)
    'lastQty': '$lastQty',
    if (bidPrice != null)
    'bidPrice': '$bidPrice',
    if (bidQty != null)
    'bidQty': '$bidQty',
    if (askPrice != null)
    'askPrice': '$askPrice',
    if (askQty != null)
    'askQty': '$askQty',
    'openPrice': '$openPrice',
    'highPrice': '$highPrice',
    'lowPrice': '$lowPrice',
    'volume': '$volume',
    'quoteVolume': '$quoteVolume',
    'openTime': openTime,
    'closeTime': closeTime,
    'firstId': firstId,
    'lastId': lastId,
    'count': count,
  };
}
