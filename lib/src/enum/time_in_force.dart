// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// This sets how long an order will be active before expiration.
enum TimeInForce {
  /// Good Til Canceled
  /// An order will be on the book unless the order is canceled.
  gtc,

  /// Immediate Or Cancel
  /// An order will try to fill the order as much as it can before the order
  /// expires.
  ioc,

  /// Fill or Kill
  /// An order will expire if the full order cannot be filled upon execution.
  fok,
}
