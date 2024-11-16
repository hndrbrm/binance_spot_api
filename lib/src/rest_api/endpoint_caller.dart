// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:http/http.dart';

mixin EndpointCaller {
  String get base;
  String get endpoint;

  Future<dynamic> call([ Map<String, dynamic>? queries ]) async {
    final url = 'https://$base/$endpoint${queries?.build()}';
    final uri = Uri.parse(url);
    final response = await get(uri);
    return response.body.decode();
  }
}

extension on Map<String, dynamic> {
  String build() => '?${entries
    .map((e) => '${e.key.encode()}=${'${e.value}'.encode()}')
    .join('&')}';
}

extension on String {
  String encode() => Uri.encodeComponent(this);

  dynamic decode() => isNotEmpty ? jsonDecode(this) : null;
}
