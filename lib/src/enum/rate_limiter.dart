// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum RateLimiter {
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
  rawRequest,
}
