// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../data_source.dart';
import '../endpoint_caller.dart';
import '../http_method.dart';

/// Test connectivity to the Rest API and get the current server time.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#check-server-time
mixin ServerTimeEndpoint on EndpointCaller {
  static const dataSource = DataSource.memory;
  static const endpoint = 'api/v3/time';
  static const method = HttpMethod.get;
  static const weight = 1;

  Future<ServerTime> serverTime() async {
    final json = await call(endpoint: endpoint) as Map<String, dynamic>;

    return ServerTime.fromJson(json);
  }
}

final class ServerTime {
  ServerTime.fromJson(Map<String, dynamic> json)
  : serverTime = json['serverTime'];

  final int serverTime;

  Map<String, dynamic> toJson() => {
    'serverTime': serverTime,
  };
}
