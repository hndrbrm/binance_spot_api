// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'error_exception.dart';

enum OtherIssue implements ErrorCode {
  /// This code is sent when an error has been returned by the matching engine.
  ///
  /// See Further documentation on:
  /// [NetworkIssue.errorMsgReceived]
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2010-new_order_rejected
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#messages-for--1010-error_msg_received--2010-new_order_rejected-and--2011-cancel_rejected
  newOrderRejected,

  /// This code is sent when an error has been returned by the matching engine.
  ///
  /// See Further documentation on:
  /// [NetworkIssue.errorMsgReceived]
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2011-cancel_rejected
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#messages-for--1010-error_msg_received--2010-new_order_rejected-and--2011-cancel_rejected
  cancelRejected,

  /// Order does not exist.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2013-no_such_order
  noSuchOrder,

  /// API-key format invalid.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2014-bad_api_key_fmt
  badApiKeyFmt,

  /// Invalid API-key, IP, or permissions for action.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2015-rejected_mbx_key
  rejectedMbxKey,

  /// No trading window could be found for the symbol. Try ticker/24hrs instead.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2016-no_trading_window
  noTradingWindow,

  /// This code is sent when either the cancellation of the order failed or
  /// the new order placement failed but not both.
  ///
  /// Filter Failures:
  /// * "Filter failure: PRICE_FILTER"
  /// price is too high, too low, and/or not following the tick size rule for
  /// the symbol.
  ///
  /// * "Filter failure: PERCENT_PRICE"
  /// price is X% too high or X% too low from the average weighted price over
  /// the last Y minutes.
  ///
  /// * "Filter failure: LOT_SIZE"
  /// quantity is too high, too low, and/or not following the step size rule
  /// for the symbol.
  ///
  /// * "Filter failure: MIN_NOTIONAL"
  /// price * quantity is too low to be a valid order for the symbol.
  ///
  /// * "Filter failure: NOTIONAL"
  /// price * quantity is not within range of the minNotional and maxNotional
  ///
  /// * "Filter failure: ICEBERG_PARTS"
  /// ICEBERG order would break into too many parts; icebergQty is too small.
  ///
  /// * "Filter failure: MARKET_LOT_SIZE"
  /// MARKET order's quantity is too high, too low, and/or not following
  /// the step size rule for the symbol.
  ///
  /// * "Filter failure: MAX_POSITION"
  /// The account's position has reached the maximum defined limit.
  /// This is composed of the sum of the balance of the base asset, and the sum
  /// of the quantity of all open BUY orders.
  ///
  /// * "Filter failure: MAX_NUM_ORDERS"
  /// Account has too many open orders on the symbol.
  ///
  /// * "Filter failure: MAX_NUM_ALGO_ORDERS"
  /// Account has too many open stop loss and/or take profit orders on the
  /// symbol.
  ///
  /// * "Filter failure: MAX_NUM_ICEBERG_ORDERS"
  /// Account has too many open iceberg orders on the symbol.
  ///
  /// * "Filter failure: TRAILING_DELTA"
  /// trailingDelta is not within the defined range of the filter for that
  /// order type.
  ///
  /// * "Filter failure: EXCHANGE_MAX_NUM_ORDERS"
  /// Account has too many open orders on the exchange.
  ///
  /// * "Filter failure: EXCHANGE_MAX_NUM_ALGO_ORDERS"
  /// Account has too many open stop loss and/or take profit orders on
  /// the exchange.
  ///
  /// * "Filter failure: EXCHANGE_MAX_NUM_ICEBERG_ORDERS"
  /// Account has too many open iceberg orders on the exchange.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2021-order-cancel-replace-partially-failed
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#filter-failures
  orderCancelReplacePartiallyFailed,

  /// This code is sent when both the cancellation of the order failed and
  /// the new order placement failed.
  ///
  /// For Further documentation read [orderCancelReplacePartiallyFailed].
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2022-order-cancel-replace-failed
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#filter-failures
  orderCancelReplaceFailed,

  /// Order was canceled or expired with no executed qty over 90 days ago and
  /// has been archived.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-2026-order_archived
  orderArchived;

  static OtherIssue parse(int code) =>
    switch (code) {
      -2010 => newOrderRejected,
      -2011 => cancelRejected,
      -2013 => noSuchOrder,
      -2014 => badApiKeyFmt,
      -2015 => rejectedMbxKey,
      -2016 => noTradingWindow,
      -2021 => orderCancelReplacePartiallyFailed,
      -2022 => orderCancelReplaceFailed,
      -2026 => orderArchived,
      _ => throw UnimplementedError('$code'),
    };

  @override
  int get value => switch (this) {
    newOrderRejected => -2010,
    cancelRejected => -2011,
    noSuchOrder => -2013,
    badApiKeyFmt => -2014,
    rejectedMbxKey => -2015,
    noTradingWindow => -2016,
    orderCancelReplacePartiallyFailed => -2021,
    orderCancelReplaceFailed => -2022,
    orderArchived => -2026,
  };
}
