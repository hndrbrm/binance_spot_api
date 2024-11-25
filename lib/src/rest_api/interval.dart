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

  static const oneSecond = Interval._(1, IntervalUnit.second);

  static const oneMinute = Interval._(1, IntervalUnit.minute);
  static const threeMinute = Interval._(3, IntervalUnit.minute);
  static const fiveMinute = Interval._(5, IntervalUnit.minute);
  static const fifteenMinute = Interval._(15, IntervalUnit.minute);
  static const thirtyMinute = Interval._(30, IntervalUnit.minute);

  static const oneHour = Interval._(1, IntervalUnit.hour);
  static const twoHour = Interval._(2, IntervalUnit.hour);
  static const fourHour = Interval._(4, IntervalUnit.hour);
  static const sixHour = Interval._(6, IntervalUnit.hour);
  static const eightHour = Interval._(8, IntervalUnit.hour);
  static const twelveHour = Interval._(12, IntervalUnit.hour);

  static const oneDay = Interval._(1, IntervalUnit.day);
  static const threeDay = Interval._(3, IntervalUnit.day);

  static const oneWeek = Interval._(1, IntervalUnit.week);

  static const oneMonth = Interval._(1, IntervalUnit.month);

  String serialize() => '$value${unit.serialize()}';

  @override
  bool operator ==(Object other) =>
    other is Interval &&
    other.value == value &&
    other.unit == unit;

  @override
  int get hashCode => Object.hash(value, unit);
}

enum IntervalUnit {
  second,
  minute,
  hour,
  day,
  week,
  month;

  static IntervalUnit deserialize(String string) =>
    switch (string.toLowerCase()) {
      _second => second,
      _minute => minute,
      _hour => hour,
      _day => day,
      _week => week,
      _month => month,
      _ => throw UnimplementedError(string),
    };

  static const _second = 's';
  static const _minute = 'm';
  static const _hour = 'h';
  static const _day = 'd';
  static const _week = 'w';
  static const _month = 'M';

  String serialize() =>
    switch (this) {
      second => _second,
      minute => _minute,
      hour => _hour,
      day => _day,
      week => _week,
      month => _month,
    };
}
