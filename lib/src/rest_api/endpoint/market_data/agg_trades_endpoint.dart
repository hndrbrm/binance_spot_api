// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../security_type.dart';
import '../../serializer.dart';

/// Get compressed, aggregate trades.
///
/// Trades that fill at the time, from the same taker order,
/// with the same price will have the quantity aggregated.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#compressedaggregate-trades-list
mixin AggTradesEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/aggTrades';
  static const method = HttpMethod.get;
  static const weight = 2;

  Future<List<AggregateTrade>> aggTrades({
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
      .map((e) => AggregateTrade.deserialize(e))
      .toList();
  }
}

/// If [fromId], [startTime], and [endTime] are not sent, the most recent
/// aggregate trades will be returned.
final class _Parameter implements QueryBuilder {
  const _Parameter({
    required this.symbol,
    this.fromId,
    this.startTime,
    this.endTime,
    this.limit,
  })
  : assert(
    limit == null || limit <= 1000,
    'Limit are too high. Maximum limit is 1000.',
  );

  final String symbol;

  /// ID to get aggregate trades from INCLUSIVE.
  final int? fromId;

  /// Timestamp in ms to get aggregate trades from INCLUSIVE.
  final int? startTime;

  /// Timestamp in ms to get aggregate trades until INCLUSIVE.
  final int? endTime;

  /// If null, default to 500.
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

final class AggregateTrade implements Serializer {
  AggregateTrade.deserialize(Map<String, dynamic> map)
  : tradeId = map[_tradeId],
    price = double.parse(map[_price]),
    quantity = double.parse(map[_quantity]),
    firstTradeId = map[_firstTradeId],
    lastTradeId = map[_lastTradeId],
    timestamp = map[_timestamp],
    isMaker = map[_isMaker],
    isBestPriceMatch = map[_isBestPriceMatch];

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

  static const _tradeId = 'a';
  static const _price = 'p';
  static const _quantity = 'q';
  static const _firstTradeId = 'f';
  static const _lastTradeId = 'l';
  static const _timestamp = 'T';
  static const _isMaker = 'm';
  static const _isBestPriceMatch = 'M';

  @override
  Map<String, dynamic> serialize() => {
    _tradeId: tradeId,
    _price: '$price',
    _quantity: '$quantity',
    _firstTradeId: firstTradeId,
    _lastTradeId: lastTradeId,
    _timestamp: timestamp,
    _isMaker: isMaker,
    _isBestPriceMatch: isBestPriceMatch,
  };
}
