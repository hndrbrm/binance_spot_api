// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

enum OrderListStatus {
  /// This is used when the ListStatus is responding to a failed action. (E.g.
  /// order list placement or cancellation)
  response,

  /// The order list has been placed or there is an update to the order list
  /// status.
  execStarted,

  /// The order list has finished executing and thus is no longer active.
  allDone,
}
