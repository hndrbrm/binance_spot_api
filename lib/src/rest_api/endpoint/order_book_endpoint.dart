// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#order-book
mixin OrderBookEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/depth';
  static const method = HttpMethod.get;

  /// Adjusted based on the [limit].
  int weight(int limit) =>
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
    ).toQueries();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as Map<String, dynamic>;

    return OrderBook.fromJson(json);
  }
}

final class _Parameter {
  const _Parameter({
    required this.symbol,
    this.limit,
  });

  final String symbol;

  /// Default 100; max 5000.
  /// If limit > 5000. then the response will truncate to 5000.
  final int? limit;

  Map<String, dynamic> toQueries() => {
    'symbol': symbol,
    if (limit != null)
    'limit': limit,
  };
}

final class OrderBook {
  OrderBook.fromJson(Map<String, dynamic> json)
  : lastUpdateId = json['lastUpdateId'],
    bids = (json['bids'] as List<dynamic>)
      .map((e) => e as List<dynamic>)
      .map((e) => Position.fromJson(e))
      .toList(),
    asks = (json['asks'] as List<dynamic>)
      .map((e) => e as List<dynamic>)
      .map((e) => Position.fromJson(e))
      .toList();

  final int lastUpdateId;

  final List<Position> bids;
  final List<Position> asks;

  Map<String, dynamic> toJson() => {
    'lastUpdateId': lastUpdateId,
    'bids': bids.map((e) => e.toJson()).toList(),
    'closeTime': asks.map((e) => e.toJson()).toList(),
  };
}

final class Position {
  Position.fromJson(List<dynamic> json)
  : price = double.parse(json[0]),
    quantity = double.parse(json[1]);

  final double price;
  final double quantity;

  List<dynamic> toJson() => [
    '$price',
    '$quantity',
  ];
}
