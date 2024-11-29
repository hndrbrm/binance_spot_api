// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'error_exception.dart';

/// General Server or Network issues (10xx).
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#10xx---general-server-or-network-issues
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#10xx---general-server-or-network-issues
enum NetworkIssue implements ErrorCode {
  /// UNKNOWN
  ///
  /// An unknown error occurred while processing the request.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1000-unknown
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1000-unknown
  unknown,

  /// DISCONNECTED
  ///
  /// Internal error; unable to process your request. Please try again.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1001-disconnected
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1001-disconnected
  disconnected,

  /// UNAUTHORIZED
  ///
  /// You are not authorized to execute this request.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1002-unauthorized
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1002-unauthorized
  unauthorized,

  /// TOO_MANY_REQUESTS
  ///
  /// Too many requests queued.
  ///
  /// Too much request weight used; current limit is %s request weight per %s.
  /// Please use WebSocket Streams for live updates to avoid polling the API.
  ///
  /// Way too much request weight used; IP banned until %s. Please use
  /// WebSocket Streams for live updates to avoid bans.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1003-too_many_requests
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1003-too_many_requests
  tooManyRequest,

  /// UNEXPECTED_RESP
  ///
  /// An unexpected response was received from the message bus. Execution
  /// status unknown.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1006-unexpected_resp
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1006-unexpected_resp
  unexpectedResp,

  /// TIMEOUT
  ///
  /// Timeout waiting for response from backend server. Send status unknown;
  /// execution status unknown.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1007-timeout
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1007-timeout
  timeout,

  /// SERVER_BUSY
  ///
  /// Server is currently overloaded with other requests. Please try again
  /// in a few minutes.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1008-server_busy
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1008-server_busy
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
  /// (Only on Production)
  /// For reference:
  /// BUY : LIMIT_MAKER price < Last Traded Price < stopPrice
  /// SELL : LIMIT_MAKER price > Last Traded Price > stopPrice
  /// (Only on testnet)
  /// If the aboveType is LIMIT_MAKER and the belowType is either a STOP_LOSS
  /// or STOP_LOSS_LIMIT: abovePrice > Last Traded Price > belowStopPrice.
  /// If the aboveType is STOP_LOSS or STOP_LOSS_LIMIT, and the belowType
  /// is LIMIT_MAKER: aboveStopPrice > Last Traded Price > belowPrice.
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
  /// (Only on testnet)
  /// * "FIX API trading is not enabled.
  /// Order is placed on a FIX server that is not TRADE enabled.
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
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#messages-for--1010-error_msg_received--2010-new_order_rejected-and--2011-cancel_rejected
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#messages-for--1010-error_msg_received--2010-new_order_rejected-and--2011-cancel_rejected
  errorMsgReceived,

  /// INVALID_MESSAGE
  ///
  /// The request is rejected by the API. (i.e. The request didn't reach the
  /// Matching Engine.)
  ///
  /// Potential error messages can be found in Filter Failures or Failures
  /// during order placement.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1013-invalid_message
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1013-invalid_message
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#filter-failures
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#other-errors
  invalidMessage,

  /// UNKNOWN_ORDER_COMPOSITION
  ///
  /// Unsupported order combination.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1014-unknown_order_composition
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1014-unknown_order_composition
  unknownOrderComposition,

  /// TOO_MANY_ORDERS
  ///
  /// Too many new orders.
  ///
  /// Too many new orders; current limit is %s orders per %s.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1015-too_many_orders
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1015-too_many_orders
  tooManyOrders,

  /// SERVICE_SHUTTING_DOWN
  ///
  /// This service is no longer available.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1016-service_shutting_down
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1016-service_shutting_down
  serviceShuttingDown,

  /// UNSUPPORTED_OPERATION
  ///
  /// This operation is not supported.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1020-unsupported_operation
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1020-unsupported_operation
  unsupportedOperation,

  /// INVALID_TIMESTAMP
  ///
  /// Timestamp for this request is outside of the recvWindow.
  ///
  /// Timestamp for this request was 1000ms ahead of the server's time.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1021-invalid_timestamp
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1021-invalid_timestamp
  invalidTimestamp,

  /// INVALID_SIGNATURE
  ///
  /// Signature for this request is not valid.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1022-invalid_signature
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1022-invalid_signature
  invalidSignature,

  /// COMP_ID_IN_USE
  ///
  /// Only in testnet.
  ///
  /// SenderCompId(49) is currently in use. Concurrent use of the same
  /// SenderCompId within one account is not allowed.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1033-comp_id_in_use
  compIdInUse,

  /// TOO_MANY_CONNECTIONS
  ///
  /// Only in testnet.
  ///
  /// Too many concurrent connections; current limit is '%d'.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1034-too_many_connections
  tooManyConnections,

  /// LOGGED_OUT
  ///
  /// Only in testnet.
  ///
  /// Please send Logout<5> message to close the session.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1035-logged_out
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/fix-api.md#logout
  loggedOut;

  factory NetworkIssue.deserialize(int code) =>
    switch (code) {
      _unknown => unknown,
      _disconnected => disconnected,
      _unauthorized => unauthorized,
      _tooManyRequest => tooManyRequest,
      _unexpectedResp => unexpectedResp,
      _timeout => timeout,
      _serverBusy => serverBusy,
      -1010 => errorMsgReceived,
      _invalidMessage => invalidMessage,
      _unknownOrderComposition => unknownOrderComposition,
      _tooManyOrders => tooManyOrders,
      _serviceShuttingDown => serviceShuttingDown,
      _unsupportedOperation => unsupportedOperation,
      _invalidTimestamp => invalidTimestamp,
      _invalidSignature => invalidSignature,
      _compIdInUse => compIdInUse,
      _tooManyConnections => tooManyConnections,
      _loggedOut => loggedOut,
      _ => throw UnimplementedError('$code'),
    };

  static const _unknown = -1000;
  static const _disconnected = -1001;
  static const _unauthorized = -1002;
  static const _tooManyRequest = -1003;
  static const _unexpectedResp = -1006;
  static const _timeout = -1007;
  static const _serverBusy = -1008;
  static const _invalidMessage = -1013;
  static const _unknownOrderComposition = -1014;
  static const _tooManyOrders = -1015;
  static const _serviceShuttingDown = -1016;
  static const _unsupportedOperation = -1020;
  static const _invalidTimestamp = -1021;
  static const _invalidSignature = -1022;
  static const _compIdInUse = -1033;
  static const _tooManyConnections = -1034;
  static const _loggedOut = -1035;

  @override
  int serialize() =>
    switch (this) {
      unknown => _unknown,
      disconnected => _disconnected,
      unauthorized => _unauthorized,
      tooManyRequest => _tooManyRequest,
      unexpectedResp => _unexpectedResp,
      timeout => _timeout,
      serverBusy => _serverBusy,
      errorMsgReceived => -1010,
      invalidMessage => _invalidMessage,
      unknownOrderComposition => _unknownOrderComposition,
      tooManyOrders => _tooManyOrders,
      serviceShuttingDown => _serviceShuttingDown,
      unsupportedOperation => _unsupportedOperation,
      invalidTimestamp => _invalidTimestamp,
      invalidSignature => _invalidSignature,
      compIdInUse => _compIdInUse,
      tooManyConnections => _tooManyConnections,
      loggedOut => _loggedOut,
    };
}
