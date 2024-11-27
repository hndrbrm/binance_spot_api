// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#order-response-type-neworderresptype
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#order-response-type-neworderresptype
enum OrderResponseType implements Serializer {
  ack,
  result,
  full;
  
  factory OrderResponseType.deserialize(String string) =>
    switch (string) {
      _ack => ack,
      _result => result,
      _full => full,
      _ => throw UnimplementedError(string),
    };

  static const _ack = 'ACK';
  static const _result = 'RESULT';
  static const _full = 'FULL';

  @override
  String serialize() =>
    switch (this) {
      ack => _ack,
      result => _result,
      full => _full,
    };
}
