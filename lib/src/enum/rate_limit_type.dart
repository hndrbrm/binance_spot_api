// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

enum RateLimitType implements Serializer {
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

  factory RateLimitType.deserialize(String string) =>
    switch (string) {
      _requestWeight => requestWeight,
      _order => order,
      _rawRequest => rawRequest,
      _ => throw UnimplementedError(string)
    };

  static const _requestWeight = 'REQUEST_WEIGHT';
  static const _order = 'ORDERS';
  static const _rawRequest = 'RAW_REQUESTS';

  String serialize() =>
    switch (this) {
      requestWeight => _requestWeight,
      order => _order,
      rawRequest => _rawRequest,
    };
}
