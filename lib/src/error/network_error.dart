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
    invalidMessage => -1013,
    unknownOrderComposition => -1014,
    tooManyOrders => -1015,
    serviceShuttingDown => -1016,
    unsupportedOperation => -1020,
    invalidTimestamp => -1021,
    invalidSignature => -1022,
  };
}
