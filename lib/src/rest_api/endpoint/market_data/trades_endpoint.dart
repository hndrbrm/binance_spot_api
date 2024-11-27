// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../security_type.dart';
import '../../serializer.dart';

/// Get recent trades.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#recent-trades-list
mixin TradesEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/trades';
  static const method = HttpMethod.get;
  static const weight = 25;

  Future<List<Trade>> trades({
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
    );

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => Trade.deserialize(e))
      .toList();
  }
}

final class _Parameter implements QueryBuilder {
  _Parameter({
    required this.symbol,
    this.limit,
  })
  : assert(
    limit == null || limit <= 1000,
    'Limit are too high. Maximum limit are at 1000.',
  );

  final String symbol;

  /// If value is null, then default to 500.
  final int? limit;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
    if (limit != null)
    'limit': limit,
  };
}

final class Trade implements Serializer {
  Trade.deserialize(Map<String, dynamic> map)
  : id = map[_id],
    price = double.parse(map[_price]),
    qty = double.parse(map[_qty]),
    quoteQty = double.parse(map[_quoteQty]),
    time = map[_time],
    isBuyerMaker = map[_isBuyerMaker],
    isBestMatch = map[_isBestMatch];

  final int id;
  final double price;
  final double qty;
  final double quoteQty;
  final int time;
  final bool isBuyerMaker;
  final bool isBestMatch;

  static const _id = 'id';
  static const _price = 'price';
  static const _qty = 'qty';
  static const _quoteQty = 'quoteQty';
  static const _time = 'time';
  static const _isBuyerMaker = 'isBuyerMaker';
  static const _isBestMatch = 'isBestMatch';

  @override
  Map<String, dynamic> serialize() => {
    _id: id,
    _price: '$price',
    _qty: '$qty',
    _quoteQty: '$quoteQty',
    _time: time,
    _isBuyerMaker: isBuyerMaker,
    _isBestMatch: isBestMatch,
  };
}
