// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

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
    final queries = _Parameter(symbols).toQueries();

    final json = await call(
      endpoint: endpoint,
      queries: queries,
    );

    if (json is Map) {
      return [
        TickerBook.fromJson(json as Map<String, dynamic>)
      ];
    }

    return (json as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => TickerBook.fromJson(e))
      .toList();
  }
}

final class _Parameter {
  const _Parameter([ this.symbols ]);

  /// If null, bookTickers for all symbols will be returned in an array.
  final List<String>? symbols;

  Map<String, dynamic> toQueries() => {
    if (symbols != null && symbols!.length == 1)
    'symbol': symbols![0],
    if (symbols != null && symbols!.length > 1)
    'symbols': jsonEncode(symbols),
  };
}

final class TickerBook {
  TickerBook.fromJson(Map<String, dynamic> json)
  : symbol = json['symbol'],
    bidPrice = double.parse(json['bidPrice']),
    bidQty = double.parse(json['bidQty']),
    askPrice = double.parse(json['askPrice']),
    askQty = double.parse(json['askQty']);

  final String symbol;
  final double bidPrice;
  final double bidQty;
  final double askPrice;
  final double askQty;

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'bidPrice': '$bidPrice',
    'bidQty': '$bidQty',
    'askPrice': '$askPrice',
    'askQty': '$askQty',
  };
}
