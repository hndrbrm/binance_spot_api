// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'serializer.dart';

/// All endpoints return either a JSON object or array.
///
/// Data is returned in ascending order. Oldest first, newest last.
///
/// All time and timestamp related fields are in milliseconds.
///
/// (Only on testnet)
/// All time and timestamp related fields in the JSON responses are in
/// milliseconds by default. To receive the information in microseconds,
/// please add the header X-MBX-TIME-UNIT:MICROSECOND or
/// X-MBX-TIME-UNIT:microsecond.
///
/// (Only on testnet)
/// Timestamp parameters (e.g. startTime, endTime, timestamp) can be passed
/// in milliseconds or microseconds.
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#general-api-information
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/rest-api.md#general-api-information
enum BaseApi implements Serializer {
  marketDataOnly,
  api,
  apiGcp,
  api1,
  api2,
  api3,
  api4,
  testnet;

  factory BaseApi.deserialize(String string) =>
    switch (string) {
      _marketDataOnly => marketDataOnly,
      _api => api,
      _apiGcp => apiGcp,
      _api1 => api1,
      _api2 => api2,
      _api3 => api3,
      _api4 => api4,
      _testnet => testnet,
      _ => throw UnimplementedError(string),
    };

  /// For APIs that only send public market data.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#general-api-information
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/faqs/market_data_only.md
  static const _marketDataOnly = 'data-api.binance.vision';

  /// The last 4 endpoints (api1-api4) should give better performance but have
  /// less stability.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#general-api-information
  static const _api = 'api.binance.com';
  static const _apiGcp = 'api-gcp.binance.com';
  static const _api1 = 'api1.binance.com';
  static const _api2 = 'api2.binance.com';
  static const _api3 = 'api3.binance.com';
  static const _api4 = 'api4.binance.com';

  /// The base endpoint for testnet.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/rest-api.md#general-api-information
  static const _testnet = 'testnet.binance.vision/api';

  @override
  String serialize() =>
    switch (this) {
      marketDataOnly => _marketDataOnly,
      api => _api,
      apiGcp => _apiGcp,
      api1 => _api1,
      api2 => _api2,
      api3 => _api3,
      api4 => _api4,
      testnet => _testnet,
    };
}
//