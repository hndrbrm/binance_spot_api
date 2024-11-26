// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';

import '../../enum/ticker_type.dart';
import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../interval.dart';
import '../query_builder.dart';
import '../serializer.dart';

/// Rolling window price change statistics.
///
/// This endpoint is different from the [Ticker24hEndpoint].
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#rolling-window-price-change-statistics
mixin TickerEndpoint on EndpointCaller {
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/ticker';
  static const method = HttpMethod.get;

  static int weight(List<String> symbols) => max(symbols.length * 4, 200);

  Future<List<Ticker>> ticker({
    required List<String> symbols,
    Interval? windowSize,
    TickerType? type,
  }) async {
    final queries = _Parameter(
      symbols: symbols,
      windowSize: windowSize,
      type: type,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    if (json is Map) {
      return [
        Ticker.deserialize(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Ticker.deserialize(e))
      .toList();
  }
}

/// The window used to compute statistics will be no more than
/// 59999ms from the requested [windowSize].
///
/// openTime always starts on a [IntervalUnit.minute}, while the closeTime
/// is the current time of the request. As such, the effective window will be
/// up to 59999ms wider than [windowSize].
///
/// E.g. If the closeTime is 1641287867099 (January 04, 2022 09:17:47:099 UTC),
/// and the [windowSize] is [Interval.oneDay]. the openTime will be:
/// 1641201420000 (January 3, 2022, 09:17:00)
final class _Parameter implements QueryBuilder {
  _Parameter({
    required this.symbols,
    this.windowSize,
    this.type,
  })
  : assert(symbols.isNotEmpty, 'Symbols must be provided.'),
    assert(
      symbols.length <= 100,
      'Maximum number of symbols allowed in a request is 100',
    ),
    assert(() {
      if (windowSize != null) {
        return switch (windowSize.unit) {
          IntervalUnit.minute => windowSize.value.between(1, 59),
          IntervalUnit.hour => windowSize.value.between(1, 23),
          IntervalUnit.day => windowSize.value.between(1, 7),
          _ => false,
        };
      }
      return true;
    }(), 'Invalid windowSize value.');

  final List<String> symbols;

  /// The default is [Interval.oneDay].
  final Interval? windowSize;

  /// The default is [TickerType.full]
  final TickerType? type;

  @override
  Map<String, dynamic> buildQuery() => {
    if (symbols.length == 1)
    'symbol': symbols[0],
    if (symbols.length > 1)
    'symbols': jsonEncode(symbols),
    if (windowSize != null)
    'windowSize': windowSize!.serialize(),
    if (type != null)
    'type': type!.serialize(),
  };
}

final class Ticker implements Serializer {
  Ticker.deserialize(Map<String, dynamic> map)
  : symbol = map[_symbol],
    priceChange = double.parse(map[_priceChange]),
    priceChangePercent = double.parse(map[_priceChangePercent]),
    weightedAvgPrice = double.parse(map[_weightedAvgPrice]),
    openPrice = double.parse(map[_openPrice]),
    highPrice = double.parse(map[_highPrice]),
    lowPrice = double.parse(map[_lowPrice]),
    lastPrice = double.parse(map[_lastPrice]),
    volume = double.parse(map[_volume]),
    quoteVolume = double.parse(map[_quoteVolume]),
    openTime = map[_openTime],
    closeTime = map[_closeTime],
    firstId = map[_firstId],
    lastId = map[_lastId],
    count = map[_count];

  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double weightedAvgPrice;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double lastPrice;
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
  static const _openPrice = 'openPrice';
  static const _highPrice = 'highPrice';
  static const _lowPrice = 'lowPrice';
  static const _lastPrice = 'lastPrice';
  static const _volume = 'volume';
  static const _quoteVolume = 'quoteVolume';
  static const _openTime = 'openTime';
  static const _closeTime = 'closeTime';
  static const _firstId = 'firstId';
  static const _lastId = 'lastId';
  static const _count = 'count';

  @override
  Map<String, dynamic> serialize() => {
    _symbol: symbol,
    _priceChange: '$priceChange',
    _priceChangePercent: '$priceChangePercent',
    _weightedAvgPrice: '$weightedAvgPrice',
    _openPrice: '$openPrice',
    _highPrice: '$highPrice',
    _lowPrice: '$lowPrice',
    _lastPrice: '$lastPrice',
    _volume: '$volume',
    _quoteVolume: '$quoteVolume',
    _openTime: openTime,
    _closeTime: closeTime,
    _firstId: firstId,
    _lastId: lastId,
    _count: count,
  };
}

extension on int {
  bool between(int a, int b) {
    return a <= this && this <= b;
  }
}
