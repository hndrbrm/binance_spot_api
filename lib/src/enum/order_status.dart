// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#order-status-status
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#order-status-status
enum OrderStatus implements Serializer {
  /// The order has been accepted by the engine.
  newOrder,

  /// The order is in a pending phase until the working order of an order list
  /// has been fully filled.
  pendingNew,

  /// A part of the order has been filled.
  partiallyFilled,

  /// The order has been completed.
  filled,

  /// The order has been canceled by the user.
  canceled,

  /// Currently unused.
  pendingCancel,

  /// The order was not accepted by the engine and not processed.
  rejected,

  /// The order was canceled according to the order type's rules (e.g.
  /// LIMIT FOK orders with no fill, LIMIT IOC or MARKET orders that partially
  /// fill) or by the exchange, (e.g. orders canceled during liquidation,
  /// orders canceled during maintenance)
  expired,

  /// The order was expired by the exchange due to STP. (e.g. an order with
  /// EXPIRE_TAKER will match with existing orders on the book with the same
  /// account or same tradeGroupId)
  expiredInMatch;
  
  factory OrderStatus.deserialize(String string) =>
    switch (string) {
      _newOrder => newOrder,
      _pendingNew => pendingNew,
      _partiallyFilled => partiallyFilled,
      _filled => filled,
      _canceled => canceled,
      _pendingCancel => pendingCancel,
      _rejected => rejected,
      _expired => expired,
      _expiredInMatch => expiredInMatch,
      _ => throw UnimplementedError(string),
    };

  static const _newOrder = 'NEW';
  static const _pendingNew = 'PENDING_NEW';
  static const _partiallyFilled = 'PARTIALLY_FILLED';
  static const _filled = 'FILLED';
  static const _canceled = 'CANCELED';
  static const _pendingCancel = 'PENDING_CANCEL';
  static const _rejected = 'REJECTED';
  static const _expired = 'EXPIRED';
  static const _expiredInMatch = 'EXPIRED_IN_MATCH';
  
  @override
  String serialize() =>
    switch (this) {
      newOrder => _newOrder,
      pendingNew => _pendingNew,
      partiallyFilled => _partiallyFilled,
      filled => _filled,
      canceled => _canceled,
      pendingCancel => _pendingCancel,
      rejected => _rejected,
      expired => _expired,
      expiredInMatch => _expiredInMatch,
    };
}
