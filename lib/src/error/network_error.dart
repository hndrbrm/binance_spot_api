// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'base_error.dart';

enum NetworkError with BaseError {
  unknown(
    -1000,
    'An unknown error occurred while processing the request.',
  ),
  disconnected(
    -1001,
    'Internal error; unable to process your request. Please try again.',
  ),
  unauthorized(
    -1002,
    'You are not authorized to execute this request.',
  ),
  tooManyRequest(
    -1003,
    '''Possible Cause:
    * Too many requests queued.
    * Too much request weight used; current limit is %s request weight per %s.
      Please use WebSocket Streams for live updates to avoid polling the API.
    * Way too much request weight used; IP banned until %s.
      Please use WebSocket Streams for live updates to avoid bans.'''
  );

  const NetworkError(
    this.code,
    this.message
  );

  @override
  final int code;

  @override
  final String message;
}
