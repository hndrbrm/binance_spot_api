// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// References:
/// https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#order-types-ordertypes-type
/// https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#order-types-ordertypes-type
enum OrderType implements Serializer {
  limit,
  market,
  stopLoss,
  stopLossLimit,
  takeProfit,
  takeProfitLimit,
  limitMaker;
  
  factory OrderType.deserialize(String string) =>
    switch (string) {
      _limit => limit,
      _market => market,
      _stopLoss => stopLoss,
      _stopLossLimit => stopLossLimit,
      _takeProfit => takeProfit,
      _takeProfitLimit => takeProfitLimit,
      _limitMaker => limitMaker,
      _ => throw UnimplementedError(string),
    };

  static const _limit = 'LIMIT';
  static const _market = 'MARKET';
  static const _stopLoss = 'STOP_LOSS';
  static const _stopLossLimit = 'STOP_LOSS_LIMIT';
  static const _takeProfit = 'TAKE_PROFIT';
  static const _takeProfitLimit = 'TAKE_PROFIT_LIMIT';
  static const _limitMaker = 'LIMIT_MAKER';

  @override
  String serialize() =>
    switch (this) {
      limit => _limit,
      market => _market,
      stopLoss => _stopLoss,
      stopLossLimit => _stopLossLimit,
      takeProfit => _takeProfit,
      takeProfitLimit => _takeProfitLimit,
      limitMaker => _limitMaker,
    };
}
