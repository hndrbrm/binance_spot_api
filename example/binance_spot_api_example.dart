// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:binance_spot_api/binance_spot_api.dart';

Future<void> main() async {
  final client = MarketDataOnly();
  final a = await client.candlestick(
    symbol: 'BTCUSDT',
    interval: CandlestickInterval.hour,
  );
  for (final b in a) {
    print(b.toJson());
  }
}
