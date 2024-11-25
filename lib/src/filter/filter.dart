// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'exchange_filter.dart';
import 'filter_type.dart';
import 'symbol_filter.dart';
import 'symbol_filter_type.dart';

abstract class Filter {
  factory Filter.deserialize(Map<String, dynamic> map) {
    try {
      return SymbolFilter.deserialize(map);
    } on NotSymbolFilterType {
      return ExchangeFilter.deserialize(map);
    }
  }

  FilterType get type;

  Map<String, dynamic> serialize();
}
