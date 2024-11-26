// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';
import '../query_builder.dart';
import '../serializer.dart';

/// Best price/qty on the order book for a symbol or symbols.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#symbol-order-book-ticker
mixin TickerBookEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/ticker/bookTicker';
  static const method = HttpMethod.get;

  static int weight(List<String>? symbols) =>
    switch (symbols?.length) {
      null => 4,
      1 => 2,
      >1 => 4,
      _ => throw UnsupportedError('Should not happened!'),
    };

  Future<List<TickerBook>> tickerBook([ List<String>? symbols ]) async {
    final queries = _Parameter(symbols).buildQuery();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    if (json is Map) {
      return [
        TickerBook.deserialize(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => TickerBook.deserialize(e))
      .toList();
  }
}

final class _Parameter implements QueryBuilder {
  const _Parameter([ this.symbols ]);

  /// If null, bookTickers for all symbols will be returned in an array.
  final List<String>? symbols;

  @override
  Map<String, dynamic> buildQuery() => {
    if (symbols != null && symbols!.length == 1)
    'symbol': symbols![0],
    if (symbols != null && symbols!.length > 1)
    'symbols': jsonEncode(symbols),
  };
}

final class TickerBook implements Serializer {
  TickerBook.deserialize(Map<String, dynamic> map)
  : symbol = map[_symbol],
    bidPrice = double.parse(map[_bidPrice]),
    bidQty = double.parse(map[_bidQty]),
    askPrice = double.parse(map[_askPrice]),
    askQty = double.parse(map[_askQty]);

  final String symbol;
  final double bidPrice;
  final double bidQty;
  final double askPrice;
  final double askQty;

  static const _symbol = 'symbol';
  static const _bidPrice = 'bidPrice';
  static const _bidQty = 'bidQty';
  static const _askPrice = 'askPrice';
  static const _askQty = 'askQty';

  @override
  Map<String, dynamic> serialize() => {
    _symbol: symbol,
    _bidPrice: '$bidPrice',
    _bidQty: '$bidQty',
    _askPrice: '$askPrice',
    _askQty: '$askQty',
  };
}
