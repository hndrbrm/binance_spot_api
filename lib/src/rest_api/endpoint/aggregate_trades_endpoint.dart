// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../query_builder.dart';

/// Get compressed, aggregate trades.
///
/// Trades that fill at the time, from the same taker order,
/// with the same price will have the quantity aggregated.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#compressedaggregate-trades-list
mixin AggregateTradesEndpoint on EndpointCaller {
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/aggTrades';
  static const method = HttpMethod.get;
  static const weight = 2;

  /// If [fromId], [startTime], and [endTime] are not sent, the most recent
  /// aggregate trades will be returned.
  Future<List<AggregateTrade>> aggregateTrades({
    required String symbol,
    int? fromId,
    int? startTime,
    int? endTime,
    int? limit,
  }) async {
    final queries = _Parameter(
      symbol: symbol,
      fromId: fromId,
      startTime: startTime,
      endTime: endTime,
      limit: limit,
    ).buildQuery();

    final json = call(
      endpoint: endpoint,
      queries: queries,
    ) as List<dynamic>;

    return json
      .map((e) => AggregateTrade.fromJson(e))
      .toList();
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter({
    required this.symbol,
    this.fromId,
    this.startTime,
    this.endTime,
    this.limit,
  });

  final String symbol;

  /// ID to get aggregate trades from INCLUSIVE.
  final int? fromId;

  /// Timestamp in ms to get aggregate trades from INCLUSIVE.
  final int? startTime;

  /// Timestamp in ms to get aggregate trades until INCLUSIVE.
  final int? endTime;

  /// Default 500; max 1000.
  final int? limit;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
    if (fromId != null)
    'fromId': fromId,
    if (startTime != null)
    'startTime': startTime,
    if (endTime != null)
    'endTime': endTime,
    if (limit != null)
    'limit': limit,
  };
}

final class AggregateTrade {
  AggregateTrade.fromJson(Map<String, dynamic> json)
  : tradeId = json['a'],
    price = double.parse(json['p']),
    quantity = double.parse(json['q']),
    firstTradeId = json['f'],
    lastTradeId = json['l'],
    timestamp = json['T'],
    isMaker = json['m'],
    isBestPriceMatch = json['M'];

  final int tradeId;
  final double price;
  final double quantity;
  final int firstTradeId;
  final int lastTradeId;
  final int timestamp;

  /// Was the buyer the maker?
  final bool isMaker;

  /// Was the trade the best price match?
  final bool isBestPriceMatch;

  Map<String, dynamic> toJson() => {
    'a': tradeId,
    'p': '$price',
    'q': '$quantity',
    'f': firstTradeId,
    'l': lastTradeId,
    'T': timestamp,
    'm': isMaker,
    'M': isBestPriceMatch,
  };
}
