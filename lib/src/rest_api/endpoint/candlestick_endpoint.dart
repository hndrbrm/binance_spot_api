// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

/// Kline/candlestick bars for a symbol. Klines are uniquely identified by
/// their open time.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#klinecandlestick-data
mixin CandlestickEndpoint on EndpointCaller {
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/klines';
  static const method = HttpMethod.get;
  static const weight = 2;

  /// If [fromId], [startTime], and [endTime] are not sent, the most recent
  /// aggregate trades will be returned.
  Future<List<Candlestick>> candlestick({
    required String symbol,
    required CandlestickInterval interval,
    int? startTime,
    int? endTime,
    String? timeZone,
    int? limit,
  }) async {
    final queries = _Parameter(
      symbol: symbol,
      interval: interval,
      startTime: startTime,
      endTime: endTime,
      timeZone: timeZone,
      limit: limit,
    ).toQueries();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as List<dynamic>;

    return json
      .map((e) => Candlestick.fromJson(e))
      .toList();
  }
}

final class _Parameter {
  const _Parameter({
    required this.symbol,
    required this.interval,
    this.startTime,
    this.endTime,
    this.timeZone,
    this.limit,
  });

  final String symbol;
  final CandlestickInterval interval;

  /// If [startTime] and [endTime] are not sent, the most recent klines are
  /// returned.
  ///
  /// The [startTime] and [endTime] are always interpreted in UTC, regardless
  /// of timeZone
  final int? startTime;
  final int? endTime;

  /// Supported values:
  /// * Hours and minutes (e.g. -1:00, 05:45)
  /// * Only hours (e.g. 0, 8, 4)
  /// * Accepted range is strictly [-12:00 to +14:00] inclusive
  ///
  /// Default: 0 (UTC)
  final String? timeZone;

  /// Default 500; max 1000.
  final int? limit;

  Map<String, dynamic> toQueries() => {
    'symbol': symbol,
    'interval': interval.toLetter(),
    if (startTime != null)
    'startTime': startTime,
    if (endTime != null)
    'endTime': endTime,
    if (timeZone != null)
    'timeZone': timeZone,
    if (limit != null)
    'limit': limit,
  };
}

final class Candlestick {
  Candlestick.fromJson(List<dynamic> json)
  : openTime = json[0],
    openPrice = double.parse(json[1]),
    highPrice = double.parse(json[2]),
    lowPrice = double.parse(json[3]),
    closePrice = double.parse(json[4]),
    volume = double.parse(json[5]),
    closeTime = json[6],
    quoteVolume = double.parse(json[7]),
    numberOfTrade = json[8],
    buyBaseVolume = double.parse(json[9]),
    buyQuoteVolume = double.parse(json[10]),
    unused = json[11];

  final int openTime;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final double volume;
  final int closeTime;
  final double quoteVolume;
  final int numberOfTrade;
  final double buyBaseVolume;
  final double buyQuoteVolume;
  final String unused;

  List<dynamic> toJson() => [
    openTime,
    '$openPrice',
    '$highPrice',
    '$lowPrice',
    '$closePrice',
    '$volume',
    closeTime,
    '$quoteVolume',
    numberOfTrade,
    '$buyBaseVolume',
    '$buyQuoteVolume',
    unused,
  ];
}

enum CandlestickInterval {
  second,
  minute, minute3, minute5, minute15, minute30,
  hour, hour2, hour4, hour6, hour8, hour12,
  day, day3,
  week,
  month;

  String toLetter() =>
    switch (this) {
      second => '1s',
      minute => '1m',
      minute3 => '3m',
      minute5 => '5m',
      minute15 => '15m',
      minute30 => '30m',
      hour => '1h',
      hour2 => '2h',
      hour4 => '4h',
      hour6 => '6h',
      hour8 => '8h',
      hour12 => '12h',
      day => '1d',
      day3 => '3d',
      week => '1w',
      month => '1M',
    };
}
