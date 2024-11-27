// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// Each endpoint has a security type that determines how you will interact
/// with it. This is stated next to the NAME of the endpoint.
///
/// If no security type is stated, assume the security type
/// is [SecurityType.none].
///
/// API-keys are passed into the Rest API via the X-MBX-APIKEY header.
///
/// API-keys and secret-keys are case sensitive.
///
/// API-keys can be configured to only access certain types of secure endpoints.
/// For example, one API-key could be used for TRADE only, while another
/// API-key can access everything except for TRADE routes.
///
/// By default, API-keys can access all secure routes.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#endpoint-security-type
enum SecurityType {
  /// Endpoint can be accessed freely.
  none,

  /// Endpoint requires sending a valid API-Key and [Signature].
  trade,

  /// Endpoint requires sending a valid API-Key and [Signature].
  userData,

  /// Endpoint requires sending a valid API-Key.
  userStream,
}
