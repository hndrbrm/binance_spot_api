// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../query_builder.dart';

/// Latest price for a symbol or symbols.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#symbol-price-ticker
mixin TickerPriceEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/ticker/price';
  static const method = HttpMethod.get;

  static int weight(List<String>? symbols) =>
    switch (symbols?.length) {
      null => 4,
      1 => 2,
      >1 => 4,
      _ => throw UnsupportedError('Should not happened!'),
    };

  Future<List<TickerPrice>> tickerPrice([ List<String>? symbols ]) async {
    final queries = _Parameter(symbols).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    if (json is Map) {
      return [
        TickerPrice.fromJson(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => TickerPrice.fromJson(e))
      .toList();
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter([ this.symbols ]);

  /// If null, prices for all symbols will be returned in an array.
  final List<String>? symbols;

  @override
  Map<String, dynamic> buildQuery() => {
    if (symbols != null && symbols!.length == 1)
    'symbol': symbols![0],
    if (symbols != null && symbols!.length > 1)
    'symbols': jsonEncode(symbols),
  };
}

final class TickerPrice {
  TickerPrice.fromJson(Map<String, dynamic> json)
  : symbol = json['symbol'],
    price = double.parse(json['price']);

  final String symbol;
  final double price;

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'bidPrice': '$price',
  };
}
