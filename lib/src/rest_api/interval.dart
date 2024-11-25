// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

final class Interval {
  Interval.deserialize(String string)
  : this._splitPosition(string, string.length - 1);

  Interval._splitPosition(String string, int position)
  : value = int.parse(string.substring(0, position)),
    unit = IntervalUnit.deserialize(string[position]);

  const Interval._(this.value, this.unit);

  final int value;
  final IntervalUnit unit;

  static const Interval oneDay = Interval._(1, IntervalUnit.day);

  String serialize() => '$value${unit.serialize()}';
}

enum IntervalUnit {
  second,
  minute,
  hour,
  day;

  static IntervalUnit deserialize(String string) =>
    switch (string.toLowerCase()) {
      's' => second,
      'm' => minute,
      'h' => hour,
      'd' => day,
      _ => throw UnimplementedError(string),
    };

  String serialize() =>
    switch (this) {
      second => 's',
      minute => 'm',
      hour => 'h',
      day => 'd',
    };
}
