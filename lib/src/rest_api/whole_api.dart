// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'endpoint/general/exchange_info_endpoint.dart';
import 'endpoint/general/ping_endpoint.dart';
import 'endpoint/general/time_endpoint.dart';
import 'endpoint/market_data/agg_trades_endpoint.dart';
import 'endpoint/market_data/avg_price_endpoint.dart';
import 'endpoint/market_data/depth_endpoint.dart';
import 'endpoint/market_data/historical_trades_endpoint.dart';
import 'endpoint/market_data/klines_endpoint.dart';
import 'endpoint/market_data/ticker_24h_endpoint.dart';
import 'endpoint/market_data/ticker_book_endpoint.dart';
import 'endpoint/market_data/ticker_endpoint.dart';
import 'endpoint/market_data/ticker_price_endpoint.dart';
import 'endpoint/market_data/ticker_trading_endpoint.dart';
import 'endpoint/market_data/trades_endpoint.dart';
import 'endpoint_caller.dart';
import 'general.dart';

final class WholeApi with
  EndpointCaller,

  // General Endpoint
  ExchangeInfoEndpoint,
  PingEndpoint,
  TimeEndpoint,

  // Market Data Endpoint
  AggTradesEndpoint,
  AvgPriceEndpoint,
  DepthEndpoint,
  HistoricalTradesEndpoint,
  KlinesEndpoint,
  Ticker24hEndpoint,
  TickerBookEndpoint,
  TickerEndpoint,
  TickerPriceEndpoint,
  TickerTradingEndpoint,
  TradesEndpoint,
  KlinesEndpoint
{
  @override
  String get base => General.endpoints.elementAt(0);
}
