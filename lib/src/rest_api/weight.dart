// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'interval.dart';

final class Weight {
  const Weight({
    required this.value,
    required this.interval,
  });

  Weight.fromJson(Map<String, dynamic> json)
  : value = json['value'],
    interval = Interval.deserialize(json['interval']);

  Weight.fromHeader(Map<String, dynamic> json)
  : this.fromJson(json.findUsedWeight());

  final int value;
  final Interval interval;

  Map<String, dynamic> toJson() => {
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
