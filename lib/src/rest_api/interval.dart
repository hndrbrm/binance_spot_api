// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

final class Interval {
  Interval.fromLetter(String value)
  : this._splitPosition(value, value.length - 1);

  Interval._splitPosition(String value, int position)
  : value = int.parse(value.substring(0, position)),
    unit = IntervalUnit.fromLetter(value[position]);

  int value;
  IntervalUnit unit;

  String toLetter() => '$value${unit.toLetter()}';
}

enum IntervalUnit {
  second,
  minute,
  hour,
  day;

  static IntervalUnit fromLetter(String letter) =>
    switch (letter.toLowerCase()) {
      's' => second,
      'm' => minute,
      'h' => hour,
      'd' => day,
      _ => throw UnimplementedError(letter),
    };

  String toLetter() =>
    switch (this) {
      second => 's',
      minute => 'm',
      hour => 'h',
      day => 'd',
    };
}
