// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum TickerType {
  mini,
  full;

  factory TickerType.deserialize(String string) =>
    switch (string) {
      _mini => mini,
      _full => full,
      _ => throw UnimplementedError(string),
    };

  static const _mini = 'MINI';
  static const _full = 'FULL';

  String serialize() =>
    switch (this) {
      mini => 'MINI',
      full => 'FULL',
    };
}
