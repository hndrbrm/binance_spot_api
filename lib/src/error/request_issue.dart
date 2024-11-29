// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'error_exception.dart';

/// Request issues (11xx).
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#11xx---request-issues
enum RequestIssue implements ErrorCode {
  /// ILLEGAL_CHARS
  ///
  /// Illegal characters found in a parameter.
  ///
  /// Illegal characters found in parameter '%s'; legal range is '%s'.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1100-illegal_chars
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1100-illegal_chars
  illegalChars,

  /// TOO_MANY_PARAMETERS
  ///
  /// Too many parameters sent for this endpoint.
  ///
  /// Too many parameters; expected '%s' and received '%s'.
  ///
  /// Duplicate values for a parameter detected.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1101-too_many_parameters
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1101-too_many_parameters
  tooManyParameter,

  /// MANDATORY_PARAM_EMPTY_OR_MALFORMED
  ///
  /// A mandatory parameter was not sent, was empty/null, or malformed.
  ///
  /// Mandatory parameter '%s' was not sent, was empty/null, or malformed.
  ///
  /// Param '%s' or '%s' must be sent, but both were empty/null!
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1102-mandatory_param_empty_or_malformed
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1102-mandatory_param_empty_or_malformed
  mandatoryParamEmptyOrMalformed,

  /// UNKNOWN_PARAM
  ///
  /// An unknown parameter was sent.
  ///
  /// Undefined Tag. (Only in testnet)
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1103-unknown_param
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1103-unknown_param
  unknownParam,

  /// UNREAD_PARAMETERS
  ///
  /// Not all sent parameters were read.
  ///
  /// Not all sent parameters were read; read '%s' parameter(s) but was sent '%s'.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1104-unread_parameters
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1104-unread_parameters
  unreadParameter,

  /// PARAM_EMPTY
  ///
  /// A parameter was empty.
  ///
  /// Parameter '%s' was empty.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1105-param_empty
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1105-param_empty
  paramEmpty,

  /// PARAM_NOT_REQUIRED
  ///
  /// A parameter was sent when not required.
  ///
  /// Parameter '%s' sent when not required.
  ///
  /// A tag '%s' was sent when not required. (Only in testnet)
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1106-param_not_required
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1106-param_not_required
  paramNotRequired,

  /// PARAM_OVERFLOW
  ///
  /// Parameter '%s' overflowed.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1108-param_overflow
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1108-param_overflow
  paramOverflow,

  /// BAD_PRECISION
  ///
  /// Parameter '%s' has too much precision.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1111-bad_precision
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1111-bad_precision
  badPrecision,

  /// NO_DEPTH
  ///
  /// No orders on book for symbol.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1112-no_depth
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1112-no_depth
  noDepth,

  /// TIF_NOT_REQUIRED
  ///
  /// TimeInForce parameter sent when not required.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1114-tif_not_required
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1114-tif_not_required
  tifNotRequired,

  /// INVALID_TIF
  ///
  /// Invalid timeInForce.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1115-invalid_tif
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1115-invalid_tif
  invalidTif,

  /// INVALID_ORDER_TYPE
  ///
  /// Invalid orderType.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1116-invalid_order_type
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1116-invalid_order_type
  invalidOrderType,

  /// INVALID_SIDE
  ///
  /// Invalid side.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1117-invalid_side
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1117-invalid_side
  invalidSide,

  /// EMPTY_NEW_CL_ORD_ID
  ///
  /// New client order ID was empty.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1118-empty_new_cl_ord_id
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1118-empty_new_cl_ord_id
  emptyNewClOrdId,

  /// EMPTY_ORG_CL_ORD_ID
  ///
  /// Original client order ID was empty.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1119-empty_org_cl_ord_id
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1119-empty_org_cl_ord_id
  emptyOrgClOrdId,

  /// BAD_INTERVAL
  ///
  /// Invalid interval.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1120-bad_interval
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1120-bad_interval
  badInterval,

  /// BAD_SYMBOL
  ///
  /// Invalid symbol.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1121-bad_symbol
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1121-bad_symbol
  badSymbol,

  /// INVALID_SYMBOLSTATUS
  ///
  /// Invalid symbolStatus.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1122-invalid_symbolstatus
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1122-invalid_symbolstatus
  invalidSymbolStatus,

  /// INVALID_LISTEN_KEY
  ///
  /// This listenKey does not exist.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1125-invalid_listen_key
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1125-invalid_listen_key
  invalidListenKey,

  /// MORE_THAN_XX_HOURS
  ///
  /// Lookup interval is too big.
  ///
  /// More than %s hours between startTime and endTime.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1127-more_than_xx_hours
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1127-more_than_xx_hours
  moreThanXxHour,

  /// OPTIONAL_PARAMS_BAD_COMBO
  ///
  /// Combination of optional parameters invalid.
  ///
  /// Combination of optional fields invalid. Recommendation: '%s' and '%s'
  /// must both be sent. (Only on testnet)
  ///
  /// Fields [%s] must be sent together or omitted entirely. (only on testnet)
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1128-optional_params_bad_combo
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1128-optional_params_bad_combo
  optionalParamsBadCombo,

  /// INVALID_PARAMETER
  ///
  /// Invalid data sent for a parameter.
  ///
  /// Data sent for parameter '%s' is not valid.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1130-invalid_parameter
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1130-invalid_parameter
  invalidParameter,

  /// BAD_STRATEGY_TYPE
  ///
  /// strategyType was less than 1000000.
  ///
  /// TargetStrategy (847) was less than 1000000. (Only on testnet)
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1134-bad_strategy_type
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1134-bad_strategy_type
  badStrategyType,

  /// INVALID_JSON
  ///
  /// Invalid JSON Request
  ///
  /// JSON sent for parameter '%s' is not valid
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1135-invalid_json
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1135-invalid_json
  invalidJson,

  /// INVALID_TICKER_TYPE
  ///
  /// Invalid ticker type.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1139-invalid_ticker_type
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1139-invalid_ticker_type
  invalidTickerType,

  /// INVALID_CANCEL_RESTRICTIONS
  ///
  /// cancelRestrictions has to be either ONLY_NEW or ONLY_PARTIALLY_FILLED.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1145-invalid_cancel_restrictions
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1145-invalid_cancel_restrictions
  invalidCancelRestriction,

  /// DUPLICATE_SYMBOLS
  ///
  /// Symbol is present multiple times in the list.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1151-duplicate_symbols
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1151-duplicate_symbols
  duplicateSymbol,

  /// INVALID_SBE_HEADER
  ///
  /// Invalid X-MBX-SBE header; expected <SCHEMA_ID>:<VERSION>.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1152-invalid_sbe_header
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1152-invalid_sbe_header
  invalidSbeHeader,

  /// UNSUPPORTED_SCHEMA_ID
  ///
  /// Unsupported SBE schema ID or version specified in the X-MBX-SBE header.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1153-unsupported_schema_id
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1153-unsupported_schema_id
  unsupportedSchemaId,

  /// SBE_DISABLED
  ///
  /// SBE is not enabled.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1155-sbe_disabled
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1155-sbe_disabled
  sbeDisabled,

  /// OCO_ORDER_TYPE_REJECTED
  ///
  /// Order type not supported in OCO.
  ///
  /// If the order type provided in the aboveType and/or belowType is not
  /// supported.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1158-oco_order_type_rejected
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1158-oco_order_type_rejected
  ocoOrderTypeRejected,

  /// OCO_ICEBERGQTY_TIMEINFORCE
  ///
  /// Parameter '%s' is not supported if aboveTimeInForce/belowTimeInForce is
  /// not GTC.
  ///
  /// If the order type for the above or below leg is STOP_LOSS_LIMIT, and
  /// icebergQty is provided for that leg, the timeInForce has to be GTC else
  /// it will throw an error.
  ///
  /// TimeInForce (59) must be GTC (1) when MaxFloor (111) is used.
  /// (Only on testnet)
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1160-oco_icebergqty_timeinforce
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1160-oco_icebergqty_timeinforce
  ocoIcebergqtyTimeinforce,

  /// DEPRECATED_SCHEMA (Only on testnet)
  ///
  /// Unable to encode the response in SBE schema 'x'.
  /// Please use schema 'y' or higher.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1161-deprecated_schema
  deprecatedSchema,

  /// BUY_OCO_LIMIT_MUST_BE_BELOW
  ///
  /// A limit order in a buy OCO must be below.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1165-buy_oco_limit_must_be_below
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1165-buy_oco_limit_must_be_below
  buyOcoLimitMustBeBelow,

  /// SELL_OCO_LIMIT_MUST_BE_ABOVE
  ///
  /// A limit order in a sell OCO must be above.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1166-sell_oco_limit_must_be_above
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1166-sell_oco_limit_must_be_above
  sellOcoLimitMustBeAbove,

  /// BOTH_OCO_ORDERS_CANNOT_BE_CONTINGENT
  ///
  /// Both OCO orders cannot be contingent.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1167-both_oco_orders_cannot_be_contingent
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1167-both_oco_orders_cannot_be_contingent
  bothOcoOrdersCannotBeContingent,

  /// BOTH_OCO_ORDERS_CANNOT_BE_LIMIT
  ///
  /// At least one OCO order must be contingent.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1168-both_oco_orders_cannot_be_limit
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1168-both_oco_orders_cannot_be_limit
  bothOcoOrdersCannotBeLimit,

  /// INVALID_TAG_NUMBER
  ///
  /// Invalid tag number.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1169-invalid_tag_number
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1169-invalid_tag_number
  invalidTagNumber,

  /// TAG_NOT_DEFINED_IN_MESSAGE
  ///
  /// Tag '%s' not defined for this message type.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1170-tag_not_defined_in_message
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1170-tag_not_defined_in_message
  tagNotDefinedInMessage,

  /// TAG_APPEARS_MORE_THAN_ONCE
  ///
  /// Tag '%s' appears more than once.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1171-tag_appears_more_than_once
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1171-tag_appears_more_than_once
  tagAppearsMoreThanOnce,

  /// TAG_OUT_OF_ORDER
  ///
  /// Tag '%s' specified out of required order.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1172-tag_out_of_order
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1172-tag_out_of_order
  tagOutOfOrder,

  /// GROUP_FIELDS_OUT_OF_ORDER
  ///
  /// Repeating group '%s' fields out of order.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1173-group_fields_out_of_order
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1173-group_fields_out_of_order
  groupFieldsOutOfOrder,

  /// INVALID_COMPONENT
  ///
  /// Component '%s' is incorrectly populated on '%s' order.
  /// Recommendation: '%s'
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1174-invalid_component
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1174-invalid_component
  invalidComponent,

  /// RESET_SEQ_NUM_SUPPORT
  ///
  /// Continuation of sequence numbers to new session is currently unsupported.
  /// Sequence numbers must be reset for each new session.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1175-reset_seq_num_support
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1175-reset_seq_num_support
  resetSeqNumSupport,

  /// ALREADY_LOGGED_IN
  ///
  /// Logon<A> should only be sent once.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1176-already_logged_in
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1176-already_logged_in
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/fix-api.md#logon-main
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/fix-api.md#logon-main
  alreadyLoggedIn,

  /// GARBLED_MESSAGE
  ///
  /// CheckSum(10) contains an incorrect value.
  ///
  /// BeginString (8) is not the first tag in a message.
  ///
  /// MsgType (35) is not the third tag in a message.
  ///
  /// BodyLength (9) does not contain the correct byte count.
  ///
  /// Only printable ASCII characters and SOH (Start of Header) are allowed.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1177-garbled_message
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1177-garbled_message
  garbledMessage,

  /// BAD_SENDER_COMPID
  ///
  /// SenderCompId(49) contains an incorrect value. The SenderCompID value
  /// should not change throughout the lifetime of a session.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1178-bad_sender_compid
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1178-bad_sender_compid
  badSenderCompid,

  /// BAD_SEQ_NUM
  ///
  /// MsgSeqNum(34) contains an unexpected value. Expected: '%d'.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1179-bad_seq_num
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1179-bad_seq_num
  badSeqNum,

  /// EXPECTED_LOGON
  ///
  /// Logon<A> must be the first message in the session.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1180-expected_logon
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1180-expected_logon
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/fix-api.md#logon-main
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/fix-api.md#logon-main
  expectedLogon,

  /// TOO_MANY_MESSAGES
  ///
  /// Too many messages; current limit is '%d' messages per '%s'.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1181-too_many_messages
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1181-too_many_messages
  tooManyMessages,

  /// PARAMS_BAD_COMBO
  ///
  /// Conflicting fields: [%s]
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1182-params_bad_combo
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1182-params_bad_combo
  paramsBadCombo,

  /// NOT_ALLOWED_IN_DROP_COPY_SESSIONS
  ///
  /// Requested operation is not allowed in DropCopy sessions.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1183-not_allowed_in_drop_copy_sessions
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1183-not_allowed_in_drop_copy_sessions
  notAllowedInDropCopySessions,

  /// DROP_COPY_SESSION_NOT_ALLOWED
  ///
  /// DropCopy sessions are not supported on this server. Please reconnect to
  /// a drop copy server.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1184-drop_copy_session_not_allowed
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1184-drop_copy_session_not_allowed
  dropCopySessionNotAllowed,

  /// DROP_COPY_SESSION_REQUIRED
  ///
  /// Only DropCopy sessions are supported on this server. Either reconnect to
  /// order entry server or send DropCopyFlag (9406) field.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1185-drop_copy_session_required
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1185-drop_copy_session_required
  dropCopySessionRequired,

  /// INVALID_TIME_UNIT (Only on testnet)
  ///
  /// Invalid value for time unit; expected either MICROSECOND or MILLISECOND.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1194-invalid_time_unit
  invalidTimeUnit,

  /// BUY_OCO_STOP_LOSS_MUST_BE_ABOVE (Only on testnet)
  ///
  /// A stop loss order in a buy OCO must be above.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1196-buy_oco_stop_loss_must_be_above
  buyOcoStopLossMustBeAbove,

  /// SELL_OCO_STOP_LOSS_MUST_BE_BELOW (Only on testnet)
  ///
  /// A stop loss order in a sell OCO must be below.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1197-sell_oco_stop_loss_must_be_below
  sellOcoStopLossMustBeBelow,

  /// BUY_OCO_TAKE_PROFIT_MUST_BE_BELOW (Only on testnet)
  ///
  /// A take profit order in a buy OCO must be below.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1198-buy_oco_take_profit_must_be_below
  buyOcoTakeProfitMustBeBelow,

  /// SELL_OCO_TAKE_PROFIT_MUST_BE_ABOVE (Only on testnet)
  ///
  /// A take profit order in a sell OCO must be above.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/errors.md#-1199-sell_oco_take_profit_must_be_above
  sellOcoTakeProfitMustBeAbove;

  factory RequestIssue.deserialize(int code) =>
    switch (code) {
      _illegalChars => illegalChars,
      _tooManyParameter => tooManyParameter,
      _mandatoryParamEmptyOrMalformed => mandatoryParamEmptyOrMalformed,
      _unknownParam => unknownParam,
      _unreadParameter => unreadParameter,
      _paramEmpty => paramEmpty,
      _paramNotRequired => paramNotRequired,
      _paramOverflow => paramOverflow,
      _badPrecision => badPrecision,
      _noDepth => noDepth,
      _tifNotRequired => tifNotRequired,
      _invalidTif => invalidTif,
      _invalidOrderType => invalidOrderType,
      _invalidSide => invalidSide,
      _emptyNewClOrdId => emptyNewClOrdId,
      _emptyOrgClOrdId => emptyOrgClOrdId,
      _badInterval => badInterval,
      _badSymbol => badSymbol,
      _invalidSymbolStatus => invalidSymbolStatus,
      _invalidListenKey => invalidListenKey,
      _moreThanXxHour => moreThanXxHour,
      _optionalParamsBadCombo => optionalParamsBadCombo,
      _invalidParameter => invalidParameter,
      _badStrategyType => badStrategyType,
      _invalidJson => invalidJson,
      _invalidTickerType => invalidTickerType,
      _invalidCancelRestriction => invalidCancelRestriction,
      _duplicateSymbol => duplicateSymbol,
      _invalidSbeHeader => invalidSbeHeader,
      _unsupportedSchemaId => unsupportedSchemaId,
      _sbeDisabled => sbeDisabled,
      _ocoOrderTypeRejected => ocoOrderTypeRejected,
      _ocoIcebergqtyTimeinforce => ocoIcebergqtyTimeinforce,
      _deprecatedSchema => deprecatedSchema,
      _buyOcoLimitMustBeBelow => buyOcoLimitMustBeBelow,
      _sellOcoLimitMustBeAbove => sellOcoLimitMustBeAbove,
      _bothOcoOrdersCannotBeContingent => bothOcoOrdersCannotBeContingent,
      _bothOcoOrdersCannotBeLimit => bothOcoOrdersCannotBeLimit,
      _invalidTagNumber => invalidTagNumber,
      _tagNotDefinedInMessage => tagNotDefinedInMessage,
      _tagAppearsMoreThanOnce => tagAppearsMoreThanOnce,
      _tagOutOfOrder => tagOutOfOrder,
      _groupFieldsOutOfOrder => groupFieldsOutOfOrder,
      _invalidComponent => invalidComponent,
      _resetSeqNumSupport => resetSeqNumSupport,
      _alreadyLoggedIn => alreadyLoggedIn,
      _garbledMessage => garbledMessage,
      _badSenderCompid => badSenderCompid,
      _badSeqNum => badSeqNum,
      _expectedLogon => expectedLogon,
      _tooManyMessages => tooManyMessages,
      _paramsBadCombo => paramsBadCombo,
      _notAllowedInDropCopySessions => notAllowedInDropCopySessions,
      _dropCopySessionNotAllowed => dropCopySessionNotAllowed,
      _dropCopySessionRequired => dropCopySessionRequired,
      _invalidTimeUnit => invalidTimeUnit,
      _buyOcoStopLossMustBeAbove => buyOcoStopLossMustBeAbove,
      _sellOcoStopLossMustBeBelow => sellOcoStopLossMustBeBelow,
      _buyOcoTakeProfitMustBeBelow => buyOcoTakeProfitMustBeBelow,
      _sellOcoTakeProfitMustBeAbove => sellOcoTakeProfitMustBeAbove,
      _ => throw UnimplementedError('$code'),
    };

  static const _illegalChars = -1100;
  static const _tooManyParameter = -1101;
  static const _mandatoryParamEmptyOrMalformed = -1102;
  static const _unknownParam = -1103;
  static const _unreadParameter = -1104;
  static const _paramEmpty = -1105;
  static const _paramNotRequired = -1106;
  static const _paramOverflow = -1108;
  static const _badPrecision = -1111;
  static const _noDepth = -1112;
  static const _tifNotRequired = -1114;
  static const _invalidTif = -1115;
  static const _invalidOrderType = -1116;
  static const _invalidSide = -1117;
  static const _emptyNewClOrdId = -1118;
  static const _emptyOrgClOrdId = -1119;
  static const _badInterval = -1120;
  static const _badSymbol = -1121;
  static const _invalidSymbolStatus = -1122;
  static const _invalidListenKey = -1125;
  static const _moreThanXxHour = -1127;
  static const _optionalParamsBadCombo = -1128;
  static const _invalidParameter = -1130;
  static const _badStrategyType = -1134;
  static const _invalidJson = -1135;
  static const _invalidTickerType = -1139;
  static const _invalidCancelRestriction = -1145;
  static const _duplicateSymbol = -1151;
  static const _invalidSbeHeader = -1152;
  static const _unsupportedSchemaId = -1153;
  static const _sbeDisabled = -1155;
  static const _ocoOrderTypeRejected = -1158;
  static const _ocoIcebergqtyTimeinforce = -1160;
  static const _deprecatedSchema = -1161;
  static const _buyOcoLimitMustBeBelow = -1165;
  static const _sellOcoLimitMustBeAbove = -1166;
  static const _bothOcoOrdersCannotBeContingent = -1167;
  static const _bothOcoOrdersCannotBeLimit = -1168;
  static const _invalidTagNumber = -1169;
  static const _tagNotDefinedInMessage = -1170;
  static const _tagAppearsMoreThanOnce = -1171;
  static const _tagOutOfOrder = -1172;
  static const _groupFieldsOutOfOrder = -1173;
  static const _invalidComponent = -1174;
  static const _resetSeqNumSupport = -1175;
  static const _alreadyLoggedIn = -1176;
  static const _garbledMessage = -1177;
  static const _badSenderCompid = -1178;
  static const _badSeqNum = -1179;
  static const _expectedLogon = -1180;
  static const _tooManyMessages = -1181;
  static const _paramsBadCombo = -1182;
  static const _notAllowedInDropCopySessions = -1183;
  static const _dropCopySessionNotAllowed = -1184;
  static const _dropCopySessionRequired = -1185;
  static const _invalidTimeUnit = -1194;
  static const _buyOcoStopLossMustBeAbove = -1196;
  static const _sellOcoStopLossMustBeBelow = -1197;
  static const _buyOcoTakeProfitMustBeBelow = -1198;
  static const _sellOcoTakeProfitMustBeAbove = -1199;

  @override
  int serialize() =>
    switch (this) {
      illegalChars => _illegalChars,
      tooManyParameter => _tooManyParameter,
      mandatoryParamEmptyOrMalformed => _mandatoryParamEmptyOrMalformed,
      unknownParam => _unknownParam,
      unreadParameter => _unreadParameter,
      paramEmpty => _paramEmpty,
      paramNotRequired => _paramNotRequired,
      paramOverflow => _paramOverflow,
      badPrecision => _badPrecision,
      noDepth => _noDepth,
      tifNotRequired => _tifNotRequired,
      invalidTif => _invalidTif,
      invalidOrderType => _invalidOrderType,
      invalidSide => _invalidSide,
      emptyNewClOrdId => _emptyNewClOrdId,
      emptyOrgClOrdId => _emptyOrgClOrdId,
      badInterval => _badInterval,
      badSymbol => _badSymbol,
      invalidSymbolStatus => _invalidSymbolStatus,
      invalidListenKey => _invalidListenKey,
      moreThanXxHour => _moreThanXxHour,
      optionalParamsBadCombo => _optionalParamsBadCombo,
      invalidParameter => _invalidParameter,
      badStrategyType => _badStrategyType,
      invalidJson => _invalidJson,
      invalidTickerType => _invalidTickerType,
      invalidCancelRestriction => _invalidCancelRestriction,
      duplicateSymbol => _duplicateSymbol,
      invalidSbeHeader => _invalidSbeHeader,
      unsupportedSchemaId => _unsupportedSchemaId,
      sbeDisabled => _sbeDisabled,
      ocoOrderTypeRejected => _ocoOrderTypeRejected,
      ocoIcebergqtyTimeinforce => _ocoIcebergqtyTimeinforce,
      deprecatedSchema => _deprecatedSchema,
      buyOcoLimitMustBeBelow => _buyOcoLimitMustBeBelow,
      sellOcoLimitMustBeAbove => _sellOcoLimitMustBeAbove,
      bothOcoOrdersCannotBeContingent => _bothOcoOrdersCannotBeContingent,
      bothOcoOrdersCannotBeLimit => _bothOcoOrdersCannotBeLimit,
      invalidTagNumber => _invalidTagNumber,
      tagNotDefinedInMessage => _tagNotDefinedInMessage,
      tagAppearsMoreThanOnce => _tagAppearsMoreThanOnce,
      tagOutOfOrder => _tagOutOfOrder,
      groupFieldsOutOfOrder => _groupFieldsOutOfOrder,
      invalidComponent => _invalidComponent,
      resetSeqNumSupport => _resetSeqNumSupport,
      alreadyLoggedIn => _alreadyLoggedIn,
      garbledMessage => _garbledMessage,
      badSenderCompid => _badSenderCompid,
      badSeqNum => _badSeqNum,
      expectedLogon => _expectedLogon,
      tooManyMessages => _tooManyMessages,
      paramsBadCombo => _paramsBadCombo,
      notAllowedInDropCopySessions => _notAllowedInDropCopySessions,
      dropCopySessionNotAllowed => _dropCopySessionNotAllowed,
      dropCopySessionRequired => _dropCopySessionRequired,
      invalidTimeUnit => _invalidTimeUnit,
      buyOcoStopLossMustBeAbove => _buyOcoStopLossMustBeAbove,
      sellOcoStopLossMustBeBelow => _sellOcoStopLossMustBeBelow,
      buyOcoTakeProfitMustBeBelow => _buyOcoTakeProfitMustBeBelow,
      sellOcoTakeProfitMustBeAbove => _sellOcoTakeProfitMustBeAbove,
    };
}
