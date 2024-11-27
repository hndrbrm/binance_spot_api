// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'interval.dart';
import 'serializer.dart';

/// Every successful order response will contain a
/// X-MBX-ORDER-COUNT-(intervalNum)(intervalLetter) header indicating how
/// many orders you have placed for that interval.
///
/// To monitor this, refer to GET api/v3/rateLimit/order.
///
/// Rejected/unsuccessful orders are not guaranteed to have
/// X-MBX-ORDER-COUNT-** headers in the response.
///
/// If you have exceeded this, you will receive a 429 error without
/// the Retry-After header.
///
/// Please note that if your orders are consistently filled by trades,
/// you can continuously place orders on the API. For more information,
/// please see Spot Unfilled Order Count Rules.
///
/// The number of unfilled orders is tracked for each account.
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#unfilled-order-count
/// * https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#query-unfilled-order-count
/// * https://github.com/binance/binance-spot-api-docs/blob/master/faqs/order_count_decrement.md
final class OrderLimit implements Serializer {
  const OrderLimit({
    required this.value,
    required this.interval,
  });

  OrderLimit.deserialize(Map<String, dynamic> map)
  : value = map['value'],
    interval = Interval.deserialize(map['interval']);

  OrderLimit.fromHeader(Map<String, dynamic> header)
  : this.deserialize(header.findOrderCount());

  final int value;
  final Interval interval;

  @override
  Map<String, dynamic> serialize() => {
    'interval': interval.serialize(),
    'value': value,
  };
}

extension on Map<String, dynamic> {
  static const pattern = 'x-mbx-order-count';

  Map<String, dynamic> findOrderCount() {
    for (final key in keys) {
      final probe = key.toLowerCase();
      if (probe.indexOf(pattern) == 0) {
        return {
          'interval': probe.substring(pattern.length + 1),
          'value': int.parse(this[key]),
        };
      }
    }

    throw OrderCountNotFound();
  }
}

final class OrderCountNotFound implements Exception {}
