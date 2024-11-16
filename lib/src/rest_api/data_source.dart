// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// The API system is asynchronous, so some delay in the response is normal
/// and expected.
///
/// Each endpoint has a data source indicating where the data is being
/// retrieved, and thus which endpoints have the most up-to-date response.
///
/// Some endpoints can have more than 1 data source. (e.g. Memory => Database)
/// This means that the endpoint will check the first Data Source, and if it
/// cannot find the value it's looking for it will check the next one.
///
/// These are the three sources, ordered by least to most potential for delays
/// in data updates.
enum DataSource {
  /// The data is from the Matching Engine.
  matchingEngine,

  /// The data is from a server's local or external memory.
  memory,

  /// The data is taken directly from a database.
  database,
}
