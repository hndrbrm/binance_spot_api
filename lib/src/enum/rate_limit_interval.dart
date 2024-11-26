// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

enum RateLimitInterval implements Serializer {
  second,
  minute,
  day;

  factory RateLimitInterval.deserialize(String string) =>
    switch (string) {
      _second => second,
      _minute => minute,
      _day => day,
      _ => throw UnimplementedError(string),
    };

  static const _second = 'SECOND';
  static const _minute = 'MINUTE';
  static const _day = 'DAY';

  @override
  String serialize() =>
    switch (this) {
      second => _second,
      minute => _minute,
      day => _day,
    };
}
