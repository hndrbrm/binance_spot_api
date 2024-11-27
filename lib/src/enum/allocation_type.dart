// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#allocationtype
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#allocationtype
enum AllocationType implements Serializer {
  sor;

  factory AllocationType.deserialize(String string) =>
    switch (string) {
      _sor => sor,
      _ => throw UnimplementedError(string),
    };

  static const _sor = 'SOR';

  @override
  String serialize() =>
    switch (this) {
      sor => _sor,
    };
}
