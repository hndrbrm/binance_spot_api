// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'data_source.dart';
import 'endpoint_caller.dart';
import 'http_method.dart';

/// Current average price for a symbol.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#current-average-price
mixin AveragePriceEndpoint on EndpointCaller {
  static const method = HttpMethod.get;
  static const weight = 2;
  static const dataSource = DataSource.memory;

  @override
  String get endpoint => 'api/v3/avgPrice';

  Future<AveragePrice> averagePrice(String symbol) async {
    final queries = { 'symbol': symbol };

    final json = await call(queries) as Map<String, dynamic>;

    return AveragePrice.fromJson(json);
  }
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
