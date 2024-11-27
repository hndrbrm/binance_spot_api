// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../security_type.dart';
import 'klines_endpoint.dart';

/// The request is similar to [KlinesEndpoint] having the same parameters
/// and response.
///
/// [UiKlinesEndpoint] return modified kline data, optimized for presentation
/// of candlestick charts.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#uiklines
mixin UiKlinesEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.database;
  static const endpoint = 'api/v3/uiKlines';
  static const method = HttpMethod.get;
  static const weight = 2;

  Future<List<Kline>> uiKlines({
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
