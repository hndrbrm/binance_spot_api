// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#order-list-status-liststatustype
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#order-list-status-liststatustype
enum OrderListStatus implements Serializer {
  /// This is used when the ListStatus is responding to a failed action. (E.g.
  /// order list placement or cancellation)
  response,

  /// The order list has been placed or there is an update to the order list
  /// status.
  execStarted,

  /// The order list has finished executing and thus is no longer active.
  allDone;

  factory OrderListStatus.deserialize(String string) =>
    switch (string) {
    _response => response,
    _execStarted => execStarted,
    _allDone => allDone,
      _ => throw UnimplementedError(string),
    };

  static const _response = 'RESPONSE';
  static const _execStarted = 'EXEC_STARTED';
  static const _allDone = 'ALL_DONE';
  
  @override
  String serialize() =>
    switch (this) {
      response => _response,
      execStarted => _execStarted,
      allDone => _allDone,
    };
}
