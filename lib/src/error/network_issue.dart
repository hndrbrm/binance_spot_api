// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'error_exception.dart';

/// General Server or Network issues (10xx).
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#10xx---general-server-or-network-issues
enum NetworkIssue implements ErrorCode {
  /// An unknown error occurred while processing the request.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1000-unknown
  unknown,

  /// Internal error; unable to process your request. Please try again.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1001-disconnected
  disconnected,

  /// You are not authorized to execute this request.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1002-unauthorized
  unauthorized,

  /// Too many requests queued.
  ///
  /// Too much request weight used; current limit is %s request weight per %s.
  /// Please use WebSocket Streams for live updates to avoid polling the API.
  ///
  /// Way too much request weight used; IP banned until %s. Please use
  /// WebSocket Streams for live updates to avoid bans.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1003-too_many_requests
  tooManyRequest,

  /// An unexpected response was received from the message bus. Execution
  /// status unknown.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1006-unexpected_resp
  unexpectedResp,

  /// Timeout waiting for response from backend server. Send status unknown;
  /// execution status unknown.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1007-timeout
  timeout,

  /// Server is currently overloaded with other requests. Please try again
  /// in a few minutes.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1008-server_busy
  serverBusy,

  /// This code is sent when an error has been returned by the matching engine.
  /// The following messages which will indicate the specific error:
  ///
  /// * "Unknown order sent."
  /// The order (by either orderId, clOrdId, origClOrdId) could not be found.
  ///
  /// * "Duplicate order sent."
  /// The clOrdId is already in use.
  ///
  /// * "Market is closed."
  /// The symbol is not trading.
  ///
  /// * "Account has insufficient balance for requested action."
  /// Not enough funds to complete the action.
  ///
  /// * "Market orders are not supported for this symbol."
  /// MARKET is not enabled on the symbol.
  ///
  /// * "Iceberg orders are not supported for this symbol."
  /// icebergQty is not enabled on the symbol.
  ///
  /// * "Stop loss orders are not supported for this symbol."
  /// STOP_LOSS is not enabled on the symbol.
  ///
  /// * "Stop loss limit orders are not supported for this symbol."
  /// STOP_LOSS_LIMIT is not enabled on the symbol.
  ///
  /// * "Take profit orders are not supported for this symbol."
  /// TAKE_PROFIT is not enabled on the symbol.
  ///
  /// * "Take profit limit orders are not supported for this symbol."
  /// TAKE_PROFIT_LIMIT is not enabled on the symbol.
  ///
  /// * "Price * QTY is zero or less."
  /// price * quantity is too low.
  ///
  /// * "IcebergQty exceeds QTY."
  /// icebergQty must be less than the order quantity.
  ///
  /// * "This action is disabled on this account."
  /// Contact customer support; some actions have been disabled on the account.
  ///
  /// * "This account may not place or cancel orders."
  /// Contact customer support; the account has trading ability disabled.
  ///
  /// * "Unsupported order combination"
  /// The orderType, timeInForce, stopPrice, and/or icebergQty combination
  /// isn't allowed.
  ///
  /// * "Order would trigger immediately."
  /// The order's stop price is not valid when compared to the last traded
  /// price.
  ///
  /// * "Cancel order is invalid. Check origClOrdId and orderId."
  /// No origClOrdId or orderId was sent in.
  ///
  /// * "Order would immediately match and take."
  /// LIMIT_MAKER order type would immediately match and trade, and not be
  /// a pure maker order.
  ///
  /// * "The relationship of the prices for the orders is not correct."
  /// The prices set in the OCO is breaking the Price restrictions.
  /// For reference:
  /// BUY : LIMIT_MAKER price < Last Traded Price < stopPrice
  /// SELL : LIMIT_MAKER price > Last Traded Price > stopPrice
  ///
  /// * "OCO orders are not supported for this symbol"
  /// OCO is not enabled on the symbol.
  ///
  /// * "Quote order qty market orders are not support for this symbol."
  /// MARKET orders using the parameter quoteOrderQty are not enabled on
  /// the symbol.
  ///
  /// * "Trailing stop orders are not supported for this symbol."
  /// Orders using trailingDelta are not enabled on the symbol.
  ///
  /// * "Order cancel-replace is not supported for this symbol."
  /// POST /api/v3/order/cancelReplace (REST API) or order.cancelReplace
  /// (WebSocket API) is not enabled on the symbol.
  ///
  /// * "This symbol is not permitted for this account."
  /// Account and symbol do not have the same permissions.
  /// (e.g. SPOT, MARGIN, etc)
  ///
  /// * "This symbol is restricted for this account."
  /// Account is unable to trade on that symbol. (e.g. An ISOLATED_MARGIN
  /// account cannot place SPOT orders.)
  ///
  /// * "Order was not canceled due to cancel restrictions."
  /// Either cancelRestrictions was set to ONLY_NEW but the order status
  /// was not NEW or cancelRestrictions was set to ONLY_PARTIALLY_FILLED
  /// but the order status was not PARTIALLY_FILLED.
  ///
  /// * "Rest API trading is not enabled."
  /// * "WebSocket API trading is not enabled."
  /// Order is being placed or a server that is not configured to allow access
  /// to TRADE endpoints.
  ///
  /// * "Order book liquidity is less than LOT_SIZE filter minimum quantity."
  /// Quote quantity market orders cannot be placed when the order book
  /// liquidity is less than minimum quantity configured for the LOT_SIZE
  /// filter.
  ///
  /// * "Order book liquidity is less than MARKET_LOT_SIZE filter minimum quantity."
  /// Quote quantity market orders cannot be placed when the order book
  /// liquidity is less than the minimum quantity for MARKET_LOT_SIZE filter.
  ///
  /// * "Order book liquidity is less than symbol minimum quantity."
  /// Quote quantity market orders cannot be placed when there are no orders
  /// on the book.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#messages-for--1010-error_msg_received--2010-new_order_rejected-and--2011-cancel_rejected
  errorMsgReceived,

  /// The request is rejected by the API. (i.e. The request didn't reach the
  /// Matching Engine.)
  ///
  /// Potential error messages can be found in Filter Failures or Failures
  /// during order placement.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1013-invalid_message
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#filter-failures
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#other-errors
  invalidMessage,

  /// Unsupported order combination.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1014-unknown_order_composition
  unknownOrderComposition,

  /// Too many new orders.
  ///
  /// Too many new orders; current limit is %s orders per %s.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1015-too_many_orders
  tooManyOrders,

  /// This service is no longer available.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1016-service_shutting_down
  serviceShuttingDown,

  /// This operation is not supported.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1020-unsupported_operation
  unsupportedOperation,

  /// Timestamp for this request is outside of the recvWindow.
  ///
  /// Timestamp for this request was 1000ms ahead of the server's time.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1021-invalid_timestamp
  invalidTimestamp,

  /// Signature for this request is not valid.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1022-invalid_signature
  invalidSignature;

  static NetworkIssue parse(int code) =>
    switch (code) {
      -1000 => unknown,
      -1001 => disconnected,
      -1002 => unauthorized,
      -1003 => tooManyRequest,
      -1006 => unexpectedResp,
      -1007 => timeout,
      -1008 => serverBusy,
      -1010 => errorMsgReceived,
      -1013 => invalidMessage,
      -1014 => unknownOrderComposition,
      -1015 => tooManyOrders,
      -1016 => serviceShuttingDown,
      -1020 => unsupportedOperation,
      -1021 => invalidTimestamp,
      -1022 => invalidSignature,
      _ => throw UnimplementedError('$code'),
    };

  @override
  int get value => switch (this) {
    unknown => -1000,
    disconnected => -1001,
    unauthorized => -1002,
    tooManyRequest => -1003,
    unexpectedResp => -1006,
    timeout => -1007,
    serverBusy => -1008,
    errorMsgReceived => -1010,
    invalidMessage => -1013,
    unknownOrderComposition => -1014,
    tooManyOrders => -1015,
    serviceShuttingDown => -1016,
    unsupportedOperation => -1020,
    invalidTimestamp => -1021,
    invalidSignature => -1022,
  };
}
