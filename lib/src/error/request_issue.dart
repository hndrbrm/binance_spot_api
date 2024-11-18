// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'error_exception.dart';

/// Request issues (11xx).
///
/// Reference:
/// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#11xx---request-issues
enum RequestIssue implements ErrorCode {
  /// Illegal characters found in a parameter.
  ///
  /// Illegal characters found in parameter '%s'; legal range is '%s'.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1100-illegal_chars
  illegalChars,

  /// Too many parameters sent for this endpoint.
  ///
  /// Too many parameters; expected '%s' and received '%s'.
  ///
  /// Duplicate values for a parameter detected.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1101-too_many_parameters
  tooManyParameter,

  /// A mandatory parameter was not sent, was empty/null, or malformed.
  ///
  /// Mandatory parameter '%s' was not sent, was empty/null, or malformed.
  ///
  /// Param '%s' or '%s' must be sent, but both were empty/null!
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1102-mandatory_param_empty_or_malformed
  mandatoryParamEmptyOrMalformed,

  /// An unknown parameter was sent.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1103-unknown_param
  unknownParam,

  /// Not all sent parameters were read.
  ///
  /// Not all sent parameters were read; read '%s' parameter(s) but was sent '%s'.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1104-unread_parameters
  unreadParameter,

  /// A parameter was empty.
  ///
  /// Parameter '%s' was empty.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1105-param_empty
  paramEmpty,

  /// A parameter was sent when not required.
  ///
  /// Parameter '%s' sent when not required.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1106-param_not_required
  paramNotRequired,

  /// Parameter '%s' overflowed.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1108-param_overflow
  paramOverflow,

  /// Parameter '%s' has too much precision.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1111-bad_precision
  badPrecision,

  /// No orders on book for symbol.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1112-no_depth
  noDepth,

  /// TimeInForce parameter sent when not required.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1114-tif_not_required
  tifNotRequired,

  /// Invalid timeInForce.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1115-invalid_tif
  invalidTif,

  /// Invalid orderType.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1116-invalid_order_type
  invalidOrderType,

  /// Invalid side.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1117-invalid_side
  invalidSide,

  /// New client order ID was empty.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1118-empty_new_cl_ord_id
  emptyNewClOrdId,

  /// Original client order ID was empty.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1119-empty_org_cl_ord_id
  emptyOrgClOrdId,

  /// Invalid interval.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1120-bad_interval
  badInterval,

  /// Invalid symbol.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1121-bad_symbol
  badSymbol,

  /// Invalid symbolStatus.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1122-invalid_symbolstatus
  invalidSymbolStatus,

  /// This listenKey does not exist.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1125-invalid_listen_key
  invalidListenKey,

  /// Lookup interval is too big.
  ///
  /// More than %s hours between startTime and endTime.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1127-more_than_xx_hours
  moreThanXxHour,

  /// Combination of optional parameters invalid.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1128-optional_params_bad_combo
  optionalParamsBadCombo,

  /// Invalid data sent for a parameter.
  ///
  /// Data sent for parameter '%s' is not valid.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1130-invalid_parameter
  invalidParameter,

  /// strategyType was less than 1000000.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1134-bad_strategy_type
  badStrategyType,

  /// Invalid JSON Request
  ///
  /// JSON sent for parameter '%s' is not valid
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1135-invalid_json
  invalidJson,

  /// Invalid ticker type.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1139-invalid_ticker_type
  invalidTickerType,

  /// cancelRestrictions has to be either ONLY_NEW or ONLY_PARTIALLY_FILLED.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1145-invalid_cancel_restrictions
  invalidCancelRestriction,

  /// Symbol is present multiple times in the list.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1151-duplicate_symbols
  duplicateSymbol,

  /// Invalid X-MBX-SBE header; expected <SCHEMA_ID>:<VERSION>.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1152-invalid_sbe_header
  invalidSbeHeader,

  /// Unsupported SBE schema ID or version specified in the X-MBX-SBE header.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1153-unsupported_schema_id
  unsupportedSchemaId,

  /// SBE is not enabled.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1155-sbe_disabled
  sbeDisabled,

  /// Order type not supported in OCO.
  ///
  /// If the order type provided in the aboveType and/or belowType is not
  /// supported.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1158-oco_order_type_rejected
  ocoOrderTypeRejected,

  /// Parameter '%s' is not supported if aboveTimeInForce/belowTimeInForce is
  /// not GTC.
  ///
  /// If the order type for the above or below leg is STOP_LOSS_LIMIT, and
  /// icebergQty is provided for that leg, the timeInForce has to be GTC else
  /// it will throw an error.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1160-oco_icebergqty_timeinforce
  ocoIcebergqtyTimeinforce,

  /// A limit order in a buy OCO must be below.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1165-buy_oco_limit_must_be_below
  buyOcoLimitMustBeBelow,

  /// A limit order in a sell OCO must be above.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1166-sell_oco_limit_must_be_above
  sellOcoLimitMustBeAbove,

  /// Both OCO orders cannot be contingent.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1167-both_oco_orders_cannot_be_contingent
  bothOcoOrdersCannotBeContingent,

  /// At least one OCO order must be contingent.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1168-both_oco_orders_cannot_be_limit
  bothOcoOrdersCannotBeLimit,

  /// Invalid tag number.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1169-invalid_tag_number
  invalidTagNumber,

  /// Tag '%s' not defined for this message type.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1170-tag_not_defined_in_message
  tagNotDefinedInMessage,

  /// Tag '%s' appears more than once.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1171-tag_appears_more_than_once
  tagAppearsMoreThanOnce,

  /// Tag '%s' specified out of required order.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1172-tag_out_of_order
  tagOutOfOrder,

  /// Repeating group '%s' fields out of order.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1173-group_fields_out_of_order
  groupFieldsOutOfOrder,

  /// Component '%s' is incorrectly populated on '%s' order.
  /// Recommendation: '%s'
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1174-invalid_component
  invalidComponent,

  /// Continuation of sequence numbers to new session is currently unsupported.
  /// Sequence numbers must be reset for each new session.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1175-reset_seq_num_support
  resetSeqNumSupport,

  /// Logon<A> should only be sent once.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1176-already_logged_in
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/fix-api.md#logon-main
  alreadyLoggedIn,

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
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1177-garbled_message
  garbledMessage,

  /// SenderCompId(49) contains an incorrect value. The SenderCompID value
  /// should not change throughout the lifetime of a session.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1178-bad_sender_compid
  badSenderCompid,

  /// MsgSeqNum(34) contains an unexpected value. Expected: '%d'.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1179-bad_seq_num
  badSeqNum,

  /// Logon<A> must be the first message in the session.
  ///
  /// References:
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1180-expected_logon
  /// * https://github.com/binance/binance-spot-api-docs/blob/master/fix-api.md#logon-main
  expectedLogon,

  /// Too many messages; current limit is '%d' messages per '%s'.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1181-too_many_messages
  tooManyMessages,

  /// Conflicting fields: [%s]
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1182-params_bad_combo
  paramsBadCombo,

  /// Requested operation is not allowed in DropCopy sessions.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1183-not_allowed_in_drop_copy_sessions
  notAllowedInDropCopySessions,

  /// DropCopy sessions are not supported on this server. Please reconnect to
  /// a drop copy server.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1184-drop_copy_session_not_allowed
  dropCopySessionNotAllowed,

  /// Only DropCopy sessions are supported on this server. Either reconnect to
  /// order entry server or send DropCopyFlag (9406) field.
  ///
  /// Reference:
  /// https://github.com/binance/binance-spot-api-docs/blob/master/errors.md#-1185-drop_copy_session_required
  dropCopySessionRequired;

  static RequestIssue parse(int code) =>
    switch (code) {
      -1100 => illegalChars,
      -1101 => tooManyParameter,
      -1102 => mandatoryParamEmptyOrMalformed,
      -1103 => unknownParam,
      -1104 => unreadParameter,
      -1105 => paramEmpty,
      -1106 => paramNotRequired,
      -1108 => paramOverflow,
      -1111 => badPrecision,
      -1112 => noDepth,
      -1114 => tifNotRequired,
      -1115 => invalidTif,
      -1116 => invalidOrderType,
      -1117 => invalidSide,
      -1118 => emptyNewClOrdId,
      -1119 => emptyOrgClOrdId,
      -1120 => badInterval,
      -1121 => badSymbol,
      -1122 => invalidSymbolStatus,
      -1125 => invalidListenKey,
      -1127 => moreThanXxHour,
      -1128 => optionalParamsBadCombo,
      -1130 => invalidParameter,
      -1134 => badStrategyType,
      -1135 => invalidJson,
      -1139 => invalidTickerType,
      -1145 => invalidCancelRestriction,
      -1151 => duplicateSymbol,
      -1152 => invalidSbeHeader,
      -1153 => unsupportedSchemaId,
      -1155 => sbeDisabled,
      -1158 => ocoOrderTypeRejected,
      -1160 => ocoIcebergqtyTimeinforce,
      -1165 => buyOcoLimitMustBeBelow,
      -1166 => sellOcoLimitMustBeAbove,
      -1167 => bothOcoOrdersCannotBeContingent,
      -1168 => bothOcoOrdersCannotBeLimit,
      -1169 => invalidTagNumber,
      -1170 => tagNotDefinedInMessage,
      -1171 => tagAppearsMoreThanOnce,
      -1172 => tagOutOfOrder,
      -1173 => groupFieldsOutOfOrder,
      -1174 => invalidComponent,
      -1175 => resetSeqNumSupport,
      -1176 => alreadyLoggedIn,
      -1177 => garbledMessage,
      -1178 => badSenderCompid,
      -1179 => badSeqNum,
      -1180 => expectedLogon,
      -1181 => tooManyMessages,
      -1182 => paramsBadCombo,
      -1183 => notAllowedInDropCopySessions,
      -1184 => dropCopySessionNotAllowed,
      -1185 => dropCopySessionRequired,
      _ => throw UnimplementedError('$code'),
    };

  @override
  int get value => switch (this) {
    illegalChars => -1100,
    tooManyParameter => -1101,
    mandatoryParamEmptyOrMalformed => -1102,
    unknownParam => -1103,
    unreadParameter => -1104,
    paramEmpty => -1105,
    paramNotRequired => -1106,
    paramOverflow => -1108,
    badPrecision => -1111,
    noDepth => -1112,
    tifNotRequired => -1114,
    invalidTif => -1115,
    invalidOrderType => -1116,
    invalidSide => -1117,
    emptyNewClOrdId => -1118,
    emptyOrgClOrdId => -1119,
    badInterval => -1120,
    badSymbol => -1121,
    invalidSymbolStatus => -1122,
    invalidListenKey => -1125,
    moreThanXxHour => -1127,
    optionalParamsBadCombo => -1128,
    invalidParameter => -1130,
    badStrategyType => -1134,
    invalidJson => -1135,
    invalidTickerType => -1139,
    invalidCancelRestriction => -1145,
    duplicateSymbol => -1151,
    invalidSbeHeader => -1152,
    unsupportedSchemaId => -1153,
    sbeDisabled => -1155,
    ocoOrderTypeRejected => -1158,
    ocoIcebergqtyTimeinforce => -1160,
    buyOcoLimitMustBeBelow => -1165,
    sellOcoLimitMustBeAbove => -1166,
    bothOcoOrdersCannotBeContingent => -1167,
    bothOcoOrdersCannotBeLimit => -1168,
    invalidTagNumber => -1169,
    tagNotDefinedInMessage => -1170,
    tagAppearsMoreThanOnce => -1171,
    tagOutOfOrder => -1172,
    groupFieldsOutOfOrder => -1173,
    invalidComponent => -1174,
    resetSeqNumSupport => -1175,
    alreadyLoggedIn => -1176,
    garbledMessage => -1177,
    badSenderCompid => -1178,
    badSeqNum => -1179,
    expectedLogon => -1180,
    tooManyMessages => -1181,
    paramsBadCombo => -1182,
    notAllowedInDropCopySessions => -1183,
    dropCopySessionNotAllowed => -1184,
    dropCopySessionRequired => -1185,
  };
}
