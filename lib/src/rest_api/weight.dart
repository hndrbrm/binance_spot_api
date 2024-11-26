// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'interval.dart';
import 'serializer.dart';

final class Weight implements Serializer {
  const Weight({
    required this.value,
    required this.interval,
  });

  Weight.deserialize(Map<String, dynamic> map)
  : value = map['value'],
    interval = Interval.deserialize(map['interval']);

  Weight.fromHeader(Map<String, dynamic> header)
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
