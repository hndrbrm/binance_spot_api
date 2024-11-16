// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'aggregate_trades_endpoint.dart';
import 'average_price_endpoint.dart';
import 'endpoint_caller.dart';

/// No API key (authentication) required, and serve public market data only.
final class MarketDataOnly with
  EndpointCaller,
  AggregateTradesEndpoint, AveragePriceEndpoint
{
  @override
  String get base => 'data-api.binance.vision';
}
