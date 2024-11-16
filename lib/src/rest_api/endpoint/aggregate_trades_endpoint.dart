// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

/// Get compressed, aggregate trades. Trades that fill at the time, from
/// the same taker order, with the same price will have the quantity aggregated.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#compressedaggregate-trades-list
mixin AggregateTradesEndpoint on EndpointCaller {
  static const method = HttpMethod.get;
  static const dataSource = DataSource.database;
  static const weight = 2;

  @override
  String get endpoint => 'api/v3/aggTrades';

  /// If [fromId], [startTime], and [endTime] are not sent, the most recent
  /// aggregate trades will be returned.
  Future<List<AggregateTrade>> aggregateTrades({
    required String symbol,
    int? fromId,
    int? startTime,
    int? endTime,
    int? limit,
  }) async {
    final queries = {
      'symbol': symbol,

      /// ID to get aggregate trades from INCLUSIVE.
      if (fromId != null)
      'fromId': fromId,

      /// Timestamp in ms to get aggregate trades from INCLUSIVE.
      if (startTime != null)
      'startTime': startTime,

      /// Timestamp in ms to get aggregate trades until INCLUSIVE.
      if (endTime != null)
      'endTime': endTime,

      /// Default 500; max 1000.
      if (limit != null)
      'limit': limit,
    };

    final json = call(queries) as List<dynamic>;

    return json
      .map((e) => AggregateTrade.fromJson(e))
      .toList();
  }
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
