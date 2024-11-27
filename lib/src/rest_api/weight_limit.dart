// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'interval.dart';
import 'serializer.dart';

/// Every request will contain X-MBX-USED-WEIGHT-(intervalNum)(intervalLetter)
/// in the response headers which has the current used weight for the IP for
/// all request rate limiters defined.
///
/// Each route has a weight which determines for the number of requests
/// each endpoint counts for. Heavier endpoints and endpoints that do
/// operations on multiple symbols will have a heavier weight.
///
/// When a 429 is received, it's your obligation as an API to back off and
/// not spam the API.
///
/// Repeatedly violating rate limits and/or failing to back off after
/// receiving 429s will result in an automated IP ban (HTTP status 418).
///
/// IP bans are tracked and scale in duration for repeat offenders, from
/// 2 minutes to 3 days.
///
/// A Retry-After header is sent with a 418 or 429 responses and will give
/// the number of seconds required to wait, in the case of a 429, to prevent
/// a ban, or, in the case of a 418, until the ban is over.
///
/// The limits on the API are based on the IPs, not the API keys.
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#ip-limits
final class WeightLimit implements Serializer {
  const WeightLimit({
    required this.value,
    required this.interval,
  });

  WeightLimit.deserialize(Map<String, dynamic> map)
  : value = map['value'],
    interval = Interval.deserialize(map['interval']);

  WeightLimit.fromHeader(Map<String, dynamic> header)
  : this.deserialize(header.findUsedWeight());

  final int value;
  final Interval interval;

  @override
  Map<String, dynamic> serialize() => {
    'interval': interval.serialize(),
    'value': value,
  };
}

extension on Map<String, dynamic> {
  static const pattern = 'x-mbx-used-weight';

  Map<String, dynamic> findUsedWeight() {
    for (final key in keys) {
      final probe = key.toLowerCase();
      if (probe.indexOf(pattern) == 0) {
        return {
          'interval': probe.substring(pattern.length + 1),
          'value': int.parse(this[key]),
        };
      }
    }

    throw UsedWeightNotFound();
  }
}

final class UsedWeightNotFound implements Exception {}
