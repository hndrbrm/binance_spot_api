// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../interval.dart';
import '../query_builder.dart';

/// Kline/candlestick bars for a symbol. Klines are uniquely identified by
/// their open time.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#klinecandlestick-data
mixin KlinesEndpoint on EndpointCaller {
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/klines';
  static const method = HttpMethod.get;
  static const weight = 2;

  Future<List<Kline>> klines({
    required String symbol,
    required KlineInterval interval,
    int? startTime,
    int? endTime,
    String? timeZone,
    int? limit,
  }) async {
    final queries = KlineParameter(
      symbol: symbol,
      interval: interval,
      startTime: startTime,
      endTime: endTime,
      timeZone: timeZone,
      limit: limit,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as List<dynamic>;

    return json
      .map((e) => Kline.deserialize(e))
      .toList();
  }
}

final class KlineParameter implements QueryBuilder {
  const KlineParameter({
    required this.symbol,
    required this.interval,
    this.startTime,
    this.endTime,
    this.timeZone,
    this.limit,
  })
  : assert(
    limit == null || limit <= 1000,
    'Limit value are too high. Maximum limit value are 1000.',
  );

  final String symbol;
  final KlineInterval interval;

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
  /// If [timeZone] provided, [interval] are interpreted in that [timeZone]
  /// instead of UTC.
  ///
  /// Default: 0 (UTC)
  final String? timeZone;

  /// If null, will default to 500.
  final int? limit;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
    'interval': interval.serialize(),
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

final class Kline {
  Kline.deserialize(List<dynamic> list)
  : openTime = list[0],
    openPrice = double.parse(list[1]),
    highPrice = double.parse(list[2]),
    lowPrice = double.parse(list[3]),
    closePrice = double.parse(list[4]),
    volume = double.parse(list[5]),
    closeTime = list[6],
    quoteVolume = double.parse(list[7]),
    numberOfTrade = list[8],
    buyBaseVolume = double.parse(list[9]),
    buyQuoteVolume = double.parse(list[10]),
    unused = list[11];

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

  List<dynamic> serialize() => [
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

enum KlineInterval {
  oneSecond,
  oneMinute, threeMinute, fiveMinute, fifteenMinute, thirtyMinute,
  oneHour, twoHour, fourHour, sixHour, eightHour, twelveHour,
  oneDay, threeDay,
  oneWeek,
  oneMonth;

  factory KlineInterval.deserialize(String string) =>
    KlineInterval.fromInterval(
      Interval.deserialize(string),
    );

  factory KlineInterval.fromInterval(Interval interval) =>
    switch (interval) {
      Interval.oneSecond => oneSecond,
      Interval.oneMinute => oneMinute,
      Interval.threeMinute => threeMinute,
      Interval.fiveMinute => fiveMinute,
      Interval.fifteenMinute => fifteenMinute,
      Interval.thirtyMinute => thirtyMinute,
      Interval.oneHour => oneHour,
      Interval.twoHour => twoHour,
      Interval.fourHour => fourHour,
      Interval.sixHour => sixHour,
      Interval.eightHour => eightHour,
      Interval.twelveHour => twelveHour,
      Interval.oneDay => oneDay,
      Interval.threeDay => threeDay,
      Interval.oneWeek => oneWeek,
      Interval.oneMonth => oneMonth,
      _ => throw UnimplementedError(interval.serialize()),
    };

  Interval toInterval() =>
    switch (this) {
      oneSecond => Interval.oneSecond,
      oneMinute => Interval.oneMinute,
      threeMinute => Interval.threeMinute,
      fiveMinute => Interval.fiveMinute,
      fifteenMinute => Interval.fifteenMinute,
      thirtyMinute => Interval.thirtyMinute,
      oneHour => Interval.oneHour,
      twoHour => Interval.twoHour,
      fourHour => Interval.fourHour,
      sixHour => Interval.sixHour,
      eightHour => Interval.eightHour,
      twelveHour => Interval.twelveHour,
      oneDay => Interval.oneDay,
      threeDay => Interval.threeDay,
      oneWeek => Interval.oneWeek,
      oneMonth => Interval.oneMonth,
    };

  String serialize() => toInterval().serialize();
}
