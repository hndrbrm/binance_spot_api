// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

/// Current average price for a symbol.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#current-average-price
mixin AveragePriceEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/avgPrice';
  static const method = HttpMethod.get;
  static const weight = 2;

  Future<AveragePrice> averagePrice(String symbol) async {
    final queries = _Parameter(symbol).toQueries();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as Map<String, dynamic>;

    return AveragePrice.fromJson(json);
  }
}

final class _Parameter {
  const _Parameter(this.symbol);

  final String symbol;

  Map<String, dynamic> toQueries() => {
    'symbol': symbol,
  };
}

final class AveragePrice {
  AveragePrice.fromJson(Map<String, dynamic> json)
  : interval = json['mins'],
    price = double.parse(json['price']),
    closeTime = json['closeTime'];

  /// Average price interval (in minutes)
  final int interval;

  /// Average price
  final double price;

  /// Last trade time
  final int closeTime;

  Map<String, dynamic> toJson() => {
    'mins': interval,
    'price': '$price',
    'closeTime': closeTime,
  };
}
