// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// This sets how long an order will be active before expiration.
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#time-in-force-timeinforce
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#time-in-force-timeinforce
enum TimeInForce implements Serializer {
  /// Good Til Canceled
  /// An order will be on the book unless the order is canceled.
  gtc,

  /// Immediate Or Cancel
  /// An order will try to fill the order as much as it can before the order
  /// expires.
  ioc,

  /// Fill or Kill
  /// An order will expire if the full order cannot be filled upon execution.
  fok;
  
  factory TimeInForce.deserialize(String string) =>
    switch (string) {
      _gtc => gtc,
      _ioc => ioc,
      _fok => fok,
      _ => throw UnimplementedError(string),
    };

  static const _gtc = 'GTC';
  static const _ioc = 'IOC';
  static const _fok = 'FOK';

  @override
  String serialize() =>
    switch (this) {
      gtc => _gtc,
      ioc => _ioc,
      fok => _fok,
    };
}
