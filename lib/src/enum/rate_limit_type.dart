// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum RateLimitType {
  /// Example:
  /// {
  ///   "rateLimitType": "REQUEST_WEIGHT",
  ///   "interval": "MINUTE",
  ///   "intervalNum": 1,
  ///   "limit": 6000
  /// }
  requestWeight,

  /// Example:
  /// {
  ///   "rateLimitType": "ORDERS",
  ///   "interval": "SECOND",
  ///   "intervalNum": 1,
  ///   "limit": 10
  /// }
  order,

  /// Example:
  /// {
  ///   "rateLimitType": "RAW_REQUESTS",
  ///   "interval": "MINUTE",
  ///   "intervalNum": 5,
  ///   "limit": 61000
  /// }
  rawRequest;

  static RateLimitType deserialize(String string) =>
    switch (string) {
      'REQUEST_WEIGHT' => requestWeight,
      'ORDERS' => order,
      'RAW_REQUESTS' => rawRequest,
      _ => throw UnimplementedError(string)
    };
  
  String serialize() =>
    switch (this) {
      requestWeight => 'REQUEST_WEIGHT',
      order => 'ORDERS',
      rawRequest => 'RAW_REQUESTS',
    };
}
