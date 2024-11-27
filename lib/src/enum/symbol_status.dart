// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// Applied for both Rest API and Websocket API.
///
/// Also applied for testnet.
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#symbol-status-status
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#symbol-status-status
enum SymbolStatus implements Serializer {
  preTrading,
  trading,
  postTrading,
  endOfDay,
  halt,
  auctionMatch,
  theBreak;
  
  factory SymbolStatus.deserialize(String string) =>
    switch (string) {
      _preTrading => preTrading,
      _trading => trading,
      _postTrading => postTrading,
      _endOfDay => endOfDay,
      _halt => halt,
      _auctionMatch => auctionMatch,
      _break => theBreak,
      _ => throw UnimplementedError(string),
    };

  static const _preTrading = 'PRE_TRADING';
  static const _trading = 'TRADING';
  static const _postTrading = 'POST_TRADING';
  static const _endOfDay = 'END_OF_DAY';
  static const _halt = 'HALT';
  static const _auctionMatch = 'AUCTION_MATCH';
  static const _break = 'BREAK';
  
  @override
  String serialize() =>
    switch (this) {
      preTrading => _preTrading,
      trading => _trading,
      postTrading => _postTrading,
      endOfDay => _endOfDay,
      halt => _halt,
      auctionMatch => _auctionMatch,
      theBreak => _break,
    };
}
