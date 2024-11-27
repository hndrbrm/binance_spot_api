// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'endpoint/market_data/agg_trades_endpoint.dart';
import 'endpoint/market_data/avg_price_endpoint.dart';
import 'endpoint/general/exchange_info_endpoint.dart';
import 'endpoint/market_data/klines_endpoint.dart';
import 'endpoint/market_data/depth_endpoint.dart';
import 'endpoint/general/time_endpoint.dart';
import 'endpoint/general/ping_endpoint.dart';
import 'endpoint/market_data/ticker_endpoint.dart';
import 'endpoint/market_data/ticker_24h_endpoint.dart';
import 'endpoint/market_data/ticker_book_endpoint.dart';
import 'endpoint/market_data/ticker_price_endpoint.dart';
import 'endpoint/market_data/trades_endpoint.dart';
import 'endpoint/market_data/ui_klines_endpoint.dart';
import 'endpoint_caller.dart';

/// No API key (authentication) required, and serve public market data only.
final class MarketDataOnlyApi with
  EndpointCaller,

  AggTradesEndpoint, AvgPriceEndpoint, ExchangeInfoEndpoint,
  KlinesEndpoint, DepthEndpoint, PingEndpoint,
  Ticker24hEndpoint, TickerBookEndpoint, TickerEndpoint, TickerPriceEndpoint,
  TimeEndpoint, TradesEndpoint, UiKlinesEndpoint
{
  @override
  String get base => 'data-api.binance.vision';
}
