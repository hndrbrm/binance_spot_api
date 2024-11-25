// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:binance_spot_api/binance_spot_api.dart';

Future<void> main() async {
  final client = MarketDataOnly();
  final a = await client.exchangeInfo(
    symbols: ['BTCUSDT', 'DYDXUSDT'],
  );
  print(a.serialize());
}
