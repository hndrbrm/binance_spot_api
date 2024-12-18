// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../../data_source.dart';
import '../../endpoint_caller.dart';
import '../../http_method.dart';
import '../../security_type.dart';

/// Test connectivity to the Rest API.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#test-connectivity
mixin PingEndpoint on EndpointCaller {
  static const securityType = SecurityType.none;
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/ping';
  static const method = HttpMethod.get;
  static const weight = 1;

  Future<void> ping() => call(endpoint: endpoint);
}
