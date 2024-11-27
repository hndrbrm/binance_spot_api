// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

final class General {
  /// The last 4 endpoints (api1-api4) should give better performance but have
  /// less stability.
  ///
  /// All endpoints return either a JSON object or array.
  ///
  /// Data is returned in ascending order. Oldest first, newest last.
  ///
  /// All time and timestamp related fields are in milliseconds.
  ///
  /// For APIs that only send public market data, please use the base endpoint
  /// https://data-api.binance.vision. Please refer to Market Data Only page.
  ///
  /// References:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#general-api-information
  /// https://github.com/binance/binance-spot-api-docs/blob/master/faqs/market_data_only.md
  static const endpoints = <String>{
    'api.binance.com',
    'api-gcp.binance.com',
    'api1.binance.com',
    'api2.binance.com',
    'api3.binance.com',
    'api4.binance.com',
  };
}
