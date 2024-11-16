// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum OrderListOrderStatus {
  /// Either an order list has been placed or there is an update to the status
  /// of the list.
  executing,

  /// An order list has completed execution and thus no longer active.
  allDone,

  /// The List Status is responding to a failed action either during order
  /// placement or order canceled.
  reject,
}