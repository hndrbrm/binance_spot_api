// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../security_type.dart';
import 'trades_endpoint.dart';

/// Get older trades.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#old-trade-lookup
mixin HistoricalTradesEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/historicalTrades';
  static const method = HttpMethod.get;
  static const weight = 25;

  Future<List<Trade>> historicalTrades({
    required String symbol,
    int? limit,
    int? fromId,
  }) async {
    final queries = _Parameter(
      symbol: symbol,
      limit: limit,
      fromId: fromId,
    ).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as List<dynamic>;

    return json.map((e) => Trade.deserialize(e)).toList();
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter({
    required this.symbol,
    this.limit,
    this.fromId,
  })
  : assert(
    limit == null || limit <= 1000,
    'Limit value are too high. Limit value maxed at 1000.'
  );

  final String symbol;

  /// If null, default to 500.
  final int? limit;

  /// TradeId to fetch from.
  ///
  /// Default gets most recent trades.
  final int? fromId;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
    if (limit != null)
    'limit': limit,
    if (fromId != null)
    'fromId': fromId,
  };
}
