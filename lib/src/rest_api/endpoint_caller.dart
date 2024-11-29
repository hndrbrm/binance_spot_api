// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:http/http.dart';

import '../error/error_exception.dart';
import 'base_api.dart';
import 'http_return_code.dart';

mixin EndpointCaller {
  BaseApi get baseApi;

  Future<dynamic> call({
    required String endpoint,
    Map<String, dynamic>? queries
  }) async {
    final url = 'https://${baseApi.serialize()}/$endpoint${queries?.build() ?? ''}';
    final uri = Uri.parse(url);
    final response = await get(uri);
    final code = HttpReturnCode.deserialize(response.statusCode);
    if (code == Ok()) {
      return response.body.decode();
    }

    try {
      final json = jsonDecode(response.body);
      throw ErrorException.deserialize(json);
    } on FormatException {
      throw Exception('Error (${response.statusCode}): ${code.serialize()}\n\n${response.body}');
    }
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
