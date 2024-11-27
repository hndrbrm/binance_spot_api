// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../query_builder.dart';
import '../../security_type.dart';
import '../../serializer.dart';

/// Current average price for a symbol.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#current-average-price
mixin AvgPriceEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/avgPrice';
  static const method = HttpMethod.get;
  static const weight = 2;

  Future<AveragePrice> avgPrice(String symbol) async {
    final queries = _Parameter(symbol).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    ) as Map<String, dynamic>;

    return AveragePrice.deserialize(json);
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter(this.symbol);

  final String symbol;

  @override
  Map<String, dynamic> buildQuery() => {
    'symbol': symbol,
  };
}

final class AveragePrice implements Serializer {
  AveragePrice.deserialize(Map<String, dynamic> json)
  : interval = json[_interval],
    price = double.parse(json[_price]),
    closeTime = json[_closeTime];

  /// Average price interval (in minutes)
  final int interval;

  /// Average price
  final double price;

  /// Last trade time
  final int closeTime;

  static const _interval = 'mins';
  static const _price = 'price';
  static const _closeTime = 'closeTime';

  @override
  Map<String, dynamic> serialize() => {
    _interval: interval,
    _price: '$price',
    _closeTime: closeTime,
  };
}
