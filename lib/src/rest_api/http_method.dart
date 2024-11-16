// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// For [get] endpoints, parameters must be sent as a query string.
///
/// For [post], [put], and [delete] endpoints, the parameters may be sent as
/// a query string or in the request body with content type
/// application/x-www-form-urlencoded. You may mix parameters between both the
/// query string and request body if you wish to do so.
///
/// Parameters may be sent in any order.
///
/// If a parameter sent in both the query string and request body, the query
/// string parameter will be used.
enum HttpMethod {
  get,

  post,

  put,

  delete,
}
