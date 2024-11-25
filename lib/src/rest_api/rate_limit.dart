// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../enum/rate_limit_interval.dart';
import '../enum/rate_limit_type.dart';

final class RateLimit {
  RateLimit.fromJson(Map<String, dynamic> json)
  : type = RateLimitType.deserialize(json['rateLimitType']),
    interval = RateLimitInterval.deserialize(json['interval']),
    value = json['intervalNum'],
    limit = json['limit'];

  final RateLimitType type;
  final RateLimitInterval interval;
  final int value;
  final int limit;
}
