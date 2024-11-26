// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../query_builder.dart';
import '../serializer.dart';

/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#order-book
mixin OrderBookEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/depth';
  static const method = HttpMethod.get;

  /// Adjusted based on the [limit].
  static int weight(int limit) =>
    switch (limit) {
      >0 && <=100 => 5,
      >100 && <=500 => 25,
      >500 && <=1000 => 50,
      >1000 && <=5000 => 250,
      _ => throw UnimplementedError('$limit'),
    };

  Future<OrderBook> orderBook({
    required String symbol,
    int? limit,
  }) async {
    final queries = _Parameter(
      symbol: symbol,
      limit: limit,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as Map<String, dynamic>;

    return OrderBook.deserialize(json);
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter({
    required this.symbol,
    this.limit,
  });

  final String symbol;

  /// Default 100; max 5000.
  /// If limit > 5000. then the response will truncate to 5000.
  final int? limit;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
    if (limit != null)
    'limit': limit,
  };
}

final class OrderBook implements Serializer {
  OrderBook.deserialize(Map<String, dynamic> map)
  : lastUpdateId = map[_lastUpdateId],
    bids = (map[_bids] as List<dynamic>)
      .map((e) => e as List<dynamic>)
      .map((e) => Position.deserialize(e))
      .toList(),
    asks = (map[_asks] as List<dynamic>)
      .map((e) => e as List<dynamic>)
      .map((e) => Position.deserialize(e))
      .toList();

  final int lastUpdateId;
  final List<Position> bids;
  final List<Position> asks;

  static const _lastUpdateId = 'lastUpdateId';
  static const _bids = 'bids';
  static const _asks = 'asks';

  @override
  Map<String, dynamic> serialize() => {
    _lastUpdateId: lastUpdateId,
    _bids: bids.map((e) => e.serialize()).toList(),
    _asks: asks.map((e) => e.serialize()).toList(),
  };
}

final class Position implements Serializer {
  Position.deserialize(List<dynamic> map)
  : price = double.parse(map[0]),
    quantity = double.parse(map[1]);

  final double price;
  final double quantity;

  @override
  List<dynamic> serialize() => [
    '$price',
    '$quantity',
  ];
}
