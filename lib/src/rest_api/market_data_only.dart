// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'endpoint/aggregate_trades_endpoint.dart';
import 'endpoint/average_price_endpoint.dart';
import 'endpoint/exchange_info_endpoint.dart';
import 'endpoint/klines_endpoint.dart';
import 'endpoint/order_book_endpoint.dart';
import 'endpoint/server_time_endpoint.dart';
import 'endpoint/test_connectivity_endpoint.dart';
import 'endpoint/ticker_endpoint.dart';
import 'endpoint/ticker_24h_endpoint.dart';
import 'endpoint/ticker_book_endpoint.dart';
import 'endpoint/ticker_price_endpoint.dart';
import 'endpoint/trades_endpoint.dart';
import 'endpoint/ui_klines_endpoint.dart';
import 'endpoint_caller.dart';

/// No API key (authentication) required, and serve public market data only.
final class MarketDataOnly with
  EndpointCaller,

  AggregateTradesEndpoint, AveragePriceEndpoint, ExchangeInfoEndpoint,
  KlinesEndpoint, OrderBookEndpoint, ServerTimeEndpoint,
  TestConnectivityEndpoint, Ticker24hEndpoint, TickerBookEndpoint,
  TickerEndpoint, TickerPriceEndpoint, TradesEndpoint, UiKlinesEndpoint
{
  @override
  String get base => 'data-api.binance.vision';
}
