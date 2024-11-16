// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:binance_spot_api/src/rest_api/endpoint/test_connectivity_endpoint.dart';

import 'endpoint/aggregate_trades_endpoint.dart';
import 'endpoint/average_price_endpoint.dart';
import 'endpoint/order_book_endpoint.dart';
import 'endpoint_caller.dart';

/// No API key (authentication) required, and serve public market data only.
final class MarketDataOnly with
  EndpointCaller,
  AggregateTradesEndpoint, AveragePriceEndpoint, OrderBookEndpoint,
  TestConnectivityEndpoint
{
  @override
  String get base => 'data-api.binance.vision';
}
