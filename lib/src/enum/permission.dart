// Copyright 2022. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import '../rest_api/serializer.dart';

/// Only spot supported on testnet.
///
/// References:
/// * https://github.com/binance/binance-spot-api-docs/blob/master/enums.md#account-and-symbol-permissions-permissions
/// * https://github.com/binance/binance-spot-api-docs/blob/master/testnet/enums.md#account-and-symbol-permissions-permissions
enum Permission implements Serializer {
  spot,
  margin,
  leveraged,
  trdGrp002, trdGrp003, trdGrp004, trdGrp005, trdGrp006, trdGrp007, trdGrp008,
  trdGrp009, trdGrp010, trdGrp011, trdGrp012, trdGrp013, trdGrp014, trdGrp015,
  trdGrp016, trdGrp017, trdGrp018, trdGrp019, trdGrp020, trdGrp021, trdGrp022,
  trdGrp023, trdGrp024, trdGrp025, trdGrp026, trdGrp027, trdGrp028, trdGrp029,
  trdGrp030, trdGrp031, trdGrp032, trdGrp033, trdGrp034, trdGrp035, trdGrp036,
  trdGrp037, trdGrp038, trdGrp039, trdGrp040, trdGrp041, trdGrp042, trdGrp043,
  trdGrp044, trdGrp045, trdGrp046, trdGrp047, trdGrp048, trdGrp049, trdGrp050,
  trdGrp051, trdGrp052, trdGrp053, trdGrp054, trdGrp055, trdGrp056, trdGrp057,
  trdGrp058, trdGrp059, trdGrp060, trdGrp061, trdGrp062, trdGrp063, trdGrp064,
  trdGrp065, trdGrp066, trdGrp067, trdGrp068, trdGrp069, trdGrp070, trdGrp071,
  trdGrp072, trdGrp073, trdGrp074, trdGrp075, trdGrp076, trdGrp077, trdGrp078,
  trdGrp079, trdGrp080, trdGrp081, trdGrp082, trdGrp083, trdGrp084, trdGrp085,
  trdGrp086, trdGrp087, trdGrp088, trdGrp089, trdGrp090, trdGrp091, trdGrp092,
  trdGrp093, trdGrp094, trdGrp095, trdGrp096, trdGrp097, trdGrp098, trdGrp099,
  trdGrp100, trdGrp101, trdGrp102, trdGrp103, trdGrp104, trdGrp105, trdGrp106,
  trdGrp107, trdGrp108, trdGrp109, trdGrp110, trdGrp111, trdGrp112, trdGrp113,
  trdGrp114, trdGrp115, trdGrp116, trdGrp117, trdGrp118, trdGrp119, trdGrp120,
  trdGrp121, trdGrp122, trdGrp123, trdGrp124, trdGrp125, trdGrp126, trdGrp127,
  trdGrp128, trdGrp129, trdGrp130, trdGrp131, trdGrp132, trdGrp133, trdGrp134,
  trdGrp135, trdGrp136, trdGrp137, trdGrp138, trdGrp139, trdGrp140, trdGrp141,
  trdGrp142, trdGrp143, trdGrp144, trdGrp145, trdGrp146, trdGrp147, trdGrp148,
  trdGrp149, trdGrp150, trdGrp151, trdGrp152, trdGrp153, trdGrp154, trdGrp155,
  trdGrp156, trdGrp157, trdGrp158, trdGrp159, trdGrp160, trdGrp161, trdGrp162,
  trdGrp163, trdGrp164, trdGrp165, trdGrp166, trdGrp167, trdGrp168, trdGrp169,
  trdGrp170, trdGrp171, trdGrp172, trdGrp173, trdGrp174, trdGrp175, trdGrp176,
  trdGrp177, trdGrp178, trdGrp179, trdGrp180, trdGrp181, trdGrp182, trdGrp183,
  trdGrp184, trdGrp185, trdGrp186, trdGrp187, trdGrp188, trdGrp189, trdGrp190,
  trdGrp191, trdGrp192, trdGrp193, trdGrp194, trdGrp195, trdGrp196, trdGrp197,
  trdGrp198, trdGrp199, trdGrp200, trdGrp201, trdGrp202, trdGrp203, trdGrp204,
  trdGrp205, trdGrp206, trdGrp207, trdGrp208, trdGrp209, trdGrp210, trdGrp211,
  trdGrp212, trdGrp213, trdGrp214, trdGrp215, trdGrp216, trdGrp217, trdGrp218,
  trdGrp219, trdGrp220, trdGrp221, trdGrp222, trdGrp223, trdGrp224, trdGrp225,
  trdGrp226, trdGrp227, trdGrp228, trdGrp229, trdGrp230, trdGrp231, trdGrp232,
  trdGrp233, trdGrp234;

  factory Permission.deserialize(String string) =>
    switch (string) {
      _spot => spot,
      _margin => margin,
      _leveraged => leveraged,
      _trdGrp002 => trdGrp002, _trdGrp003 => trdGrp003, _trdGrp004 => trdGrp004,
      _trdGrp005 => trdGrp005, _trdGrp006 => trdGrp006, _trdGrp007 => trdGrp007,
      _trdGrp008 => trdGrp008, _trdGrp009 => trdGrp009, _trdGrp010 => trdGrp010,
      _trdGrp011 => trdGrp011, _trdGrp012 => trdGrp012, _trdGrp013 => trdGrp013,
      _trdGrp014 => trdGrp014, _trdGrp015 => trdGrp015, _trdGrp016 => trdGrp016,
      _trdGrp017 => trdGrp017, _trdGrp018 => trdGrp018, _trdGrp019 => trdGrp019,
      _trdGrp020 => trdGrp020, _trdGrp021 => trdGrp021, _trdGrp022 => trdGrp022,
      _trdGrp023 => trdGrp023, _trdGrp024 => trdGrp024, _trdGrp025 => trdGrp025,
      _trdGrp026 => trdGrp026, _trdGrp027 => trdGrp027, _trdGrp028 => trdGrp028,
      _trdGrp029 => trdGrp029, _trdGrp030 => trdGrp030, _trdGrp031 => trdGrp031,
      _trdGrp032 => trdGrp032, _trdGrp033 => trdGrp033, _trdGrp034 => trdGrp034,
      _trdGrp035 => trdGrp035, _trdGrp036 => trdGrp036, _trdGrp037 => trdGrp037,
      _trdGrp038 => trdGrp038, _trdGrp039 => trdGrp039, _trdGrp040 => trdGrp040,
      _trdGrp041 => trdGrp041, _trdGrp042 => trdGrp042, _trdGrp043 => trdGrp043,
      _trdGrp044 => trdGrp044, _trdGrp045 => trdGrp045, _trdGrp046 => trdGrp046,
      _trdGrp047 => trdGrp047, _trdGrp048 => trdGrp048, _trdGrp049 => trdGrp049,
      _trdGrp050 => trdGrp050, _trdGrp051 => trdGrp051, _trdGrp052 => trdGrp052,
      _trdGrp053 => trdGrp053, _trdGrp054 => trdGrp054, _trdGrp055 => trdGrp055,
      _trdGrp056 => trdGrp056, _trdGrp057 => trdGrp057, _trdGrp058 => trdGrp058,
      _trdGrp059 => trdGrp059, _trdGrp060 => trdGrp060, _trdGrp061 => trdGrp061,
      _trdGrp062 => trdGrp062, _trdGrp063 => trdGrp063, _trdGrp064 => trdGrp064,
      _trdGrp065 => trdGrp065, _trdGrp066 => trdGrp066, _trdGrp067 => trdGrp067,
      _trdGrp068 => trdGrp068, _trdGrp069 => trdGrp069, _trdGrp070 => trdGrp070,
      _trdGrp071 => trdGrp071, _trdGrp072 => trdGrp072, _trdGrp073 => trdGrp073,
      _trdGrp074 => trdGrp074, _trdGrp075 => trdGrp075, _trdGrp076 => trdGrp076,
      _trdGrp077 => trdGrp077, _trdGrp078 => trdGrp078, _trdGrp079 => trdGrp079,
      _trdGrp080 => trdGrp080, _trdGrp081 => trdGrp081, _trdGrp082 => trdGrp082,
      _trdGrp083 => trdGrp083, _trdGrp084 => trdGrp084, _trdGrp085 => trdGrp085,
      _trdGrp086 => trdGrp086, _trdGrp087 => trdGrp087, _trdGrp088 => trdGrp088,
      _trdGrp089 => trdGrp089, _trdGrp090 => trdGrp090, _trdGrp091 => trdGrp091,
      _trdGrp092 => trdGrp092, _trdGrp093 => trdGrp093, _trdGrp094 => trdGrp094,
      _trdGrp095 => trdGrp095, _trdGrp096 => trdGrp096, _trdGrp097 => trdGrp097,
      _trdGrp098 => trdGrp098, _trdGrp099 => trdGrp099, _trdGrp100 => trdGrp100,
      _trdGrp101 => trdGrp101, _trdGrp102 => trdGrp102, _trdGrp103 => trdGrp103,
      _trdGrp104 => trdGrp104, _trdGrp105 => trdGrp105, _trdGrp106 => trdGrp106,
      _trdGrp107 => trdGrp107, _trdGrp108 => trdGrp108, _trdGrp109 => trdGrp109,
      _trdGrp110 => trdGrp110, _trdGrp111 => trdGrp111, _trdGrp112 => trdGrp112,
      _trdGrp113 => trdGrp113, _trdGrp114 => trdGrp114, _trdGrp115 => trdGrp115,
      _trdGrp116 => trdGrp116, _trdGrp117 => trdGrp117, _trdGrp118 => trdGrp118,
      _trdGrp119 => trdGrp119, _trdGrp120 => trdGrp120, _trdGrp121 => trdGrp121,
      _trdGrp122 => trdGrp122, _trdGrp123 => trdGrp123, _trdGrp124 => trdGrp124,
      _trdGrp125 => trdGrp125, _trdGrp126 => trdGrp126, _trdGrp127 => trdGrp127,
      _trdGrp128 => trdGrp128, _trdGrp129 => trdGrp129, _trdGrp130 => trdGrp130,
      _trdGrp131 => trdGrp131, _trdGrp132 => trdGrp132, _trdGrp133 => trdGrp133,
      _trdGrp134 => trdGrp134, _trdGrp135 => trdGrp135, _trdGrp136 => trdGrp136,
      _trdGrp137 => trdGrp137, _trdGrp138 => trdGrp138, _trdGrp139 => trdGrp139,
      _trdGrp140 => trdGrp140, _trdGrp141 => trdGrp141, _trdGrp142 => trdGrp142,
      _trdGrp143 => trdGrp143, _trdGrp144 => trdGrp144, _trdGrp145 => trdGrp145,
      _trdGrp146 => trdGrp146, _trdGrp147 => trdGrp147, _trdGrp148 => trdGrp148,
      _trdGrp149 => trdGrp149, _trdGrp150 => trdGrp150, _trdGrp151 => trdGrp151,
      _trdGrp152 => trdGrp152, _trdGrp153 => trdGrp153, _trdGrp154 => trdGrp154,
      _trdGrp155 => trdGrp155, _trdGrp156 => trdGrp156, _trdGrp157 => trdGrp157,
      _trdGrp158 => trdGrp158, _trdGrp159 => trdGrp159, _trdGrp160 => trdGrp160,
      _trdGrp161 => trdGrp161, _trdGrp162 => trdGrp162, _trdGrp163 => trdGrp163,
      _trdGrp164 => trdGrp164, _trdGrp165 => trdGrp165, _trdGrp166 => trdGrp166,
      _trdGrp167 => trdGrp167, _trdGrp168 => trdGrp168, _trdGrp169 => trdGrp169,
      _trdGrp170 => trdGrp170, _trdGrp171 => trdGrp171, _trdGrp172 => trdGrp172,
      _trdGrp173 => trdGrp173, _trdGrp174 => trdGrp174, _trdGrp175 => trdGrp175,
      _trdGrp176 => trdGrp176, _trdGrp177 => trdGrp177, _trdGrp178 => trdGrp178,
      _trdGrp179 => trdGrp179, _trdGrp180 => trdGrp180, _trdGrp181 => trdGrp181,
      _trdGrp182 => trdGrp182, _trdGrp183 => trdGrp183, _trdGrp184 => trdGrp184,
      _trdGrp185 => trdGrp185, _trdGrp186 => trdGrp186, _trdGrp187 => trdGrp187,
      _trdGrp188 => trdGrp188, _trdGrp189 => trdGrp189, _trdGrp190 => trdGrp190,
      _trdGrp191 => trdGrp191, _trdGrp192 => trdGrp192, _trdGrp193 => trdGrp193,
      _trdGrp194 => trdGrp194, _trdGrp195 => trdGrp195, _trdGrp196 => trdGrp196,
      _trdGrp197 => trdGrp197, _trdGrp198 => trdGrp198, _trdGrp199 => trdGrp199,
      _trdGrp200 => trdGrp200, _trdGrp201 => trdGrp201, _trdGrp202 => trdGrp202,
      _trdGrp203 => trdGrp203, _trdGrp204 => trdGrp204, _trdGrp205 => trdGrp205,
      _trdGrp206 => trdGrp206, _trdGrp207 => trdGrp207, _trdGrp208 => trdGrp208,
      _trdGrp209 => trdGrp209, _trdGrp210 => trdGrp210, _trdGrp211 => trdGrp211,
      _trdGrp212 => trdGrp212, _trdGrp213 => trdGrp213, _trdGrp214 => trdGrp214,
      _trdGrp215 => trdGrp215, _trdGrp216 => trdGrp216, _trdGrp217 => trdGrp217,
      _trdGrp218 => trdGrp218, _trdGrp219 => trdGrp219, _trdGrp220 => trdGrp220,
      _trdGrp221 => trdGrp221, _trdGrp222 => trdGrp222, _trdGrp223 => trdGrp223,
      _trdGrp224 => trdGrp224, _trdGrp225 => trdGrp225, _trdGrp226 => trdGrp226,
      _trdGrp227 => trdGrp227, _trdGrp228 => trdGrp228, _trdGrp229 => trdGrp229,
      _trdGrp230 => trdGrp230, _trdGrp231 => trdGrp231, _trdGrp232 => trdGrp232,
      _trdGrp233 => trdGrp233, _trdGrp234 => trdGrp234,
      _ => throw UnimplementedError(string),
    };

  static const _spot = 'SPOT';
  static const _margin = 'MARGIN';
  static const _leveraged = 'LEVERAGED';
  static const _trdGrp002 = 'TRD_GRP_002';
  static const _trdGrp003 = 'TRD_GRP_003';
  static const _trdGrp004 = 'TRD_GRP_004';
  static const _trdGrp005 = 'TRD_GRP_005';
  static const _trdGrp006 = 'TRD_GRP_006';
  static const _trdGrp007 = 'TRD_GRP_007';
  static const _trdGrp008 = 'TRD_GRP_008';
  static const _trdGrp009 = 'TRD_GRP_009';
  static const _trdGrp010 = 'TRD_GRP_010';
  static const _trdGrp011 = 'TRD_GRP_011';
  static const _trdGrp012 = 'TRD_GRP_012';
  static const _trdGrp013 = 'TRD_GRP_013';
  static const _trdGrp014 = 'TRD_GRP_014';
  static const _trdGrp015 = 'TRD_GRP_015';
  static const _trdGrp016 = 'TRD_GRP_016';
  static const _trdGrp017 = 'TRD_GRP_017';
  static const _trdGrp018 = 'TRD_GRP_018';
  static const _trdGrp019 = 'TRD_GRP_019';
  static const _trdGrp020 = 'TRD_GRP_020';
  static const _trdGrp021 = 'TRD_GRP_021';
  static const _trdGrp022 = 'TRD_GRP_022';
  static const _trdGrp023 = 'TRD_GRP_023';
  static const _trdGrp024 = 'TRD_GRP_024';
  static const _trdGrp025 = 'TRD_GRP_025';
  static const _trdGrp026 = 'TRD_GRP_026';
  static const _trdGrp027 = 'TRD_GRP_027';
  static const _trdGrp028 = 'TRD_GRP_028';
  static const _trdGrp029 = 'TRD_GRP_029';
  static const _trdGrp030 = 'TRD_GRP_030';
  static const _trdGrp031 = 'TRD_GRP_031';
  static const _trdGrp032 = 'TRD_GRP_032';
  static const _trdGrp033 = 'TRD_GRP_033';
  static const _trdGrp034 = 'TRD_GRP_034';
  static const _trdGrp035 = 'TRD_GRP_035';
  static const _trdGrp036 = 'TRD_GRP_036';
  static const _trdGrp037 = 'TRD_GRP_037';
  static const _trdGrp038 = 'TRD_GRP_038';
  static const _trdGrp039 = 'TRD_GRP_039';
  static const _trdGrp040 = 'TRD_GRP_040';
  static const _trdGrp041 = 'TRD_GRP_041';
  static const _trdGrp042 = 'TRD_GRP_042';
  static const _trdGrp043 = 'TRD_GRP_043';
  static const _trdGrp044 = 'TRD_GRP_044';
  static const _trdGrp045 = 'TRD_GRP_045';
  static const _trdGrp046 = 'TRD_GRP_046';
  static const _trdGrp047 = 'TRD_GRP_047';
  static const _trdGrp048 = 'TRD_GRP_048';
  static const _trdGrp049 = 'TRD_GRP_049';
  static const _trdGrp050 = 'TRD_GRP_050';
  static const _trdGrp051 = 'TRD_GRP_051';
  static const _trdGrp052 = 'TRD_GRP_052';
  static const _trdGrp053 = 'TRD_GRP_053';
  static const _trdGrp054 = 'TRD_GRP_054';
  static const _trdGrp055 = 'TRD_GRP_055';
  static const _trdGrp056 = 'TRD_GRP_056';
  static const _trdGrp057 = 'TRD_GRP_057';
  static const _trdGrp058 = 'TRD_GRP_058';
  static const _trdGrp059 = 'TRD_GRP_059';
  static const _trdGrp060 = 'TRD_GRP_060';
  static const _trdGrp061 = 'TRD_GRP_061';
  static const _trdGrp062 = 'TRD_GRP_062';
  static const _trdGrp063 = 'TRD_GRP_063';
  static const _trdGrp064 = 'TRD_GRP_064';
  static const _trdGrp065 = 'TRD_GRP_065';
  static const _trdGrp066 = 'TRD_GRP_066';
  static const _trdGrp067 = 'TRD_GRP_067';
  static const _trdGrp068 = 'TRD_GRP_068';
  static const _trdGrp069 = 'TRD_GRP_069';
  static const _trdGrp070 = 'TRD_GRP_070';
  static const _trdGrp071 = 'TRD_GRP_071';
  static const _trdGrp072 = 'TRD_GRP_072';
  static const _trdGrp073 = 'TRD_GRP_073';
  static const _trdGrp074 = 'TRD_GRP_074';
  static const _trdGrp075 = 'TRD_GRP_075';
  static const _trdGrp076 = 'TRD_GRP_076';
  static const _trdGrp077 = 'TRD_GRP_077';
  static const _trdGrp078 = 'TRD_GRP_078';
  static const _trdGrp079 = 'TRD_GRP_079';
  static const _trdGrp080 = 'TRD_GRP_080';
  static const _trdGrp081 = 'TRD_GRP_081';
  static const _trdGrp082 = 'TRD_GRP_082';
  static const _trdGrp083 = 'TRD_GRP_083';
  static const _trdGrp084 = 'TRD_GRP_084';
  static const _trdGrp085 = 'TRD_GRP_085';
  static const _trdGrp086 = 'TRD_GRP_086';
  static const _trdGrp087 = 'TRD_GRP_087';
  static const _trdGrp088 = 'TRD_GRP_088';
  static const _trdGrp089 = 'TRD_GRP_089';
  static const _trdGrp090 = 'TRD_GRP_090';
  static const _trdGrp091 = 'TRD_GRP_091';
  static const _trdGrp092 = 'TRD_GRP_092';
  static const _trdGrp093 = 'TRD_GRP_093';
  static const _trdGrp094 = 'TRD_GRP_094';
  static const _trdGrp095 = 'TRD_GRP_095';
  static const _trdGrp096 = 'TRD_GRP_096';
  static const _trdGrp097 = 'TRD_GRP_097';
  static const _trdGrp098 = 'TRD_GRP_098';
  static const _trdGrp099 = 'TRD_GRP_099';
  static const _trdGrp100 = 'TRD_GRP_100';
  static const _trdGrp101 = 'TRD_GRP_101';
  static const _trdGrp102 = 'TRD_GRP_102';
  static const _trdGrp103 = 'TRD_GRP_103';
  static const _trdGrp104 = 'TRD_GRP_104';
  static const _trdGrp105 = 'TRD_GRP_105';
  static const _trdGrp106 = 'TRD_GRP_106';
  static const _trdGrp107 = 'TRD_GRP_107';
  static const _trdGrp108 = 'TRD_GRP_108';
  static const _trdGrp109 = 'TRD_GRP_109';
  static const _trdGrp110 = 'TRD_GRP_110';
  static const _trdGrp111 = 'TRD_GRP_111';
  static const _trdGrp112 = 'TRD_GRP_112';
  static const _trdGrp113 = 'TRD_GRP_113';
  static const _trdGrp114 = 'TRD_GRP_114';
  static const _trdGrp115 = 'TRD_GRP_115';
  static const _trdGrp116 = 'TRD_GRP_116';
  static const _trdGrp117 = 'TRD_GRP_117';
  static const _trdGrp118 = 'TRD_GRP_118';
  static const _trdGrp119 = 'TRD_GRP_119';
  static const _trdGrp120 = 'TRD_GRP_120';
  static const _trdGrp121 = 'TRD_GRP_121';
  static const _trdGrp122 = 'TRD_GRP_122';
  static const _trdGrp123 = 'TRD_GRP_123';
  static const _trdGrp124 = 'TRD_GRP_124';
  static const _trdGrp125 = 'TRD_GRP_125';
  static const _trdGrp126 = 'TRD_GRP_126';
  static const _trdGrp127 = 'TRD_GRP_127';
  static const _trdGrp128 = 'TRD_GRP_128';
  static const _trdGrp129 = 'TRD_GRP_129';
  static const _trdGrp130 = 'TRD_GRP_130';
  static const _trdGrp131 = 'TRD_GRP_131';
  static const _trdGrp132 = 'TRD_GRP_132';
  static const _trdGrp133 = 'TRD_GRP_133';
  static const _trdGrp134 = 'TRD_GRP_134';
  static const _trdGrp135 = 'TRD_GRP_135';
  static const _trdGrp136 = 'TRD_GRP_136';
  static const _trdGrp137 = 'TRD_GRP_137';
  static const _trdGrp138 = 'TRD_GRP_138';
  static const _trdGrp139 = 'TRD_GRP_139';
  static const _trdGrp140 = 'TRD_GRP_140';
  static const _trdGrp141 = 'TRD_GRP_141';
  static const _trdGrp142 = 'TRD_GRP_142';
  static const _trdGrp143 = 'TRD_GRP_143';
  static const _trdGrp144 = 'TRD_GRP_144';
  static const _trdGrp145 = 'TRD_GRP_145';
  static const _trdGrp146 = 'TRD_GRP_146';
  static const _trdGrp147 = 'TRD_GRP_147';
  static const _trdGrp148 = 'TRD_GRP_148';
  static const _trdGrp149 = 'TRD_GRP_149';
  static const _trdGrp150 = 'TRD_GRP_150';
  static const _trdGrp151 = 'TRD_GRP_151';
  static const _trdGrp152 = 'TRD_GRP_152';
  static const _trdGrp153 = 'TRD_GRP_153';
  static const _trdGrp154 = 'TRD_GRP_154';
  static const _trdGrp155 = 'TRD_GRP_155';
  static const _trdGrp156 = 'TRD_GRP_156';
  static const _trdGrp157 = 'TRD_GRP_157';
  static const _trdGrp158 = 'TRD_GRP_158';
  static const _trdGrp159 = 'TRD_GRP_159';
  static const _trdGrp160 = 'TRD_GRP_160';
  static const _trdGrp161 = 'TRD_GRP_161';
  static const _trdGrp162 = 'TRD_GRP_162';
  static const _trdGrp163 = 'TRD_GRP_163';
  static const _trdGrp164 = 'TRD_GRP_164';
  static const _trdGrp165 = 'TRD_GRP_165';
  static const _trdGrp166 = 'TRD_GRP_166';
  static const _trdGrp167 = 'TRD_GRP_167';
  static const _trdGrp168 = 'TRD_GRP_168';
  static const _trdGrp169 = 'TRD_GRP_169';
  static const _trdGrp170 = 'TRD_GRP_170';
  static const _trdGrp171 = 'TRD_GRP_171';
  static const _trdGrp172 = 'TRD_GRP_172';
  static const _trdGrp173 = 'TRD_GRP_173';
  static const _trdGrp174 = 'TRD_GRP_174';
  static const _trdGrp175 = 'TRD_GRP_175';
  static const _trdGrp176 = 'TRD_GRP_176';
  static const _trdGrp177 = 'TRD_GRP_177';
  static const _trdGrp178 = 'TRD_GRP_178';
  static const _trdGrp179 = 'TRD_GRP_179';
  static const _trdGrp180 = 'TRD_GRP_180';
  static const _trdGrp181 = 'TRD_GRP_181';
  static const _trdGrp182 = 'TRD_GRP_182';
  static const _trdGrp183 = 'TRD_GRP_183';
  static const _trdGrp184 = 'TRD_GRP_184';
  static const _trdGrp185 = 'TRD_GRP_185';
  static const _trdGrp186 = 'TRD_GRP_186';
  static const _trdGrp187 = 'TRD_GRP_187';
  static const _trdGrp188 = 'TRD_GRP_188';
  static const _trdGrp189 = 'TRD_GRP_189';
  static const _trdGrp190 = 'TRD_GRP_190';
  static const _trdGrp191 = 'TRD_GRP_191';
  static const _trdGrp192 = 'TRD_GRP_192';
  static const _trdGrp193 = 'TRD_GRP_193';
  static const _trdGrp194 = 'TRD_GRP_194';
  static const _trdGrp195 = 'TRD_GRP_195';
  static const _trdGrp196 = 'TRD_GRP_196';
  static const _trdGrp197 = 'TRD_GRP_197';
  static const _trdGrp198 = 'TRD_GRP_198';
  static const _trdGrp199 = 'TRD_GRP_199';
  static const _trdGrp200 = 'TRD_GRP_200';
  static const _trdGrp201 = 'TRD_GRP_201';
  static const _trdGrp202 = 'TRD_GRP_202';
  static const _trdGrp203 = 'TRD_GRP_203';
  static const _trdGrp204 = 'TRD_GRP_204';
  static const _trdGrp205 = 'TRD_GRP_205';
  static const _trdGrp206 = 'TRD_GRP_206';
  static const _trdGrp207 = 'TRD_GRP_207';
  static const _trdGrp208 = 'TRD_GRP_208';
  static const _trdGrp209 = 'TRD_GRP_209';
  static const _trdGrp210 = 'TRD_GRP_210';
  static const _trdGrp211 = 'TRD_GRP_211';
  static const _trdGrp212 = 'TRD_GRP_212';
  static const _trdGrp213 = 'TRD_GRP_213';
  static const _trdGrp214 = 'TRD_GRP_214';
  static const _trdGrp215 = 'TRD_GRP_215';
  static const _trdGrp216 = 'TRD_GRP_216';
  static const _trdGrp217 = 'TRD_GRP_217';
  static const _trdGrp218 = 'TRD_GRP_218';
  static const _trdGrp219 = 'TRD_GRP_219';
  static const _trdGrp220 = 'TRD_GRP_220';
  static const _trdGrp221 = 'TRD_GRP_221';
  static const _trdGrp222 = 'TRD_GRP_222';
  static const _trdGrp223 = 'TRD_GRP_223';
  static const _trdGrp224 = 'TRD_GRP_224';
  static const _trdGrp225 = 'TRD_GRP_225';
  static const _trdGrp226 = 'TRD_GRP_226';
  static const _trdGrp227 = 'TRD_GRP_227';
  static const _trdGrp228 = 'TRD_GRP_228';
  static const _trdGrp229 = 'TRD_GRP_229';
  static const _trdGrp230 = 'TRD_GRP_230';
  static const _trdGrp231 = 'TRD_GRP_231';
  static const _trdGrp232 = 'TRD_GRP_232';
  static const _trdGrp233 = 'TRD_GRP_233';
  static const _trdGrp234 = 'TRD_GRP_234';

  @override
  String serialize() =>
    switch (this) {
      spot => _spot,
      margin => _margin,
      leveraged => _leveraged,
      trdGrp002 => _trdGrp002, trdGrp003 => _trdGrp003, trdGrp004 => _trdGrp004,
      trdGrp005 => _trdGrp005, trdGrp006 => _trdGrp006, trdGrp007 => _trdGrp007,
      trdGrp008 => _trdGrp008, trdGrp009 => _trdGrp009, trdGrp010 => _trdGrp010,
      trdGrp011 => _trdGrp011, trdGrp012 => _trdGrp012, trdGrp013 => _trdGrp013,
      trdGrp014 => _trdGrp014, trdGrp015 => _trdGrp015, trdGrp016 => _trdGrp016,
      trdGrp017 => _trdGrp017, trdGrp018 => _trdGrp018, trdGrp019 => _trdGrp019,
      trdGrp020 => _trdGrp020, trdGrp021 => _trdGrp021, trdGrp022 => _trdGrp022,
      trdGrp023 => _trdGrp023, trdGrp024 => _trdGrp024, trdGrp025 => _trdGrp025,
      trdGrp026 => _trdGrp026, trdGrp027 => _trdGrp027, trdGrp028 => _trdGrp028,
      trdGrp029 => _trdGrp029, trdGrp030 => _trdGrp030, trdGrp031 => _trdGrp031,
      trdGrp032 => _trdGrp032, trdGrp033 => _trdGrp033, trdGrp034 => _trdGrp034,
      trdGrp035 => _trdGrp035, trdGrp036 => _trdGrp036, trdGrp037 => _trdGrp037,
      trdGrp038 => _trdGrp038, trdGrp039 => _trdGrp039, trdGrp040 => _trdGrp040,
      trdGrp041 => _trdGrp041, trdGrp042 => _trdGrp042, trdGrp043 => _trdGrp043,
      trdGrp044 => _trdGrp044, trdGrp045 => _trdGrp045, trdGrp046 => _trdGrp046,
      trdGrp047 => _trdGrp047, trdGrp048 => _trdGrp048, trdGrp049 => _trdGrp049,
      trdGrp050 => _trdGrp050, trdGrp051 => _trdGrp051, trdGrp052 => _trdGrp052,
      trdGrp053 => _trdGrp053, trdGrp054 => _trdGrp054, trdGrp055 => _trdGrp055,
      trdGrp056 => _trdGrp056, trdGrp057 => _trdGrp057, trdGrp058 => _trdGrp058,
      trdGrp059 => _trdGrp059, trdGrp060 => _trdGrp060, trdGrp061 => _trdGrp061,
      trdGrp062 => _trdGrp062, trdGrp063 => _trdGrp063, trdGrp064 => _trdGrp064,
      trdGrp065 => _trdGrp065, trdGrp066 => _trdGrp066, trdGrp067 => _trdGrp067,
      trdGrp068 => _trdGrp068, trdGrp069 => _trdGrp069, trdGrp070 => _trdGrp070,
      trdGrp071 => _trdGrp071, trdGrp072 => _trdGrp072, trdGrp073 => _trdGrp073,
      trdGrp074 => _trdGrp074, trdGrp075 => _trdGrp075, trdGrp076 => _trdGrp076,
      trdGrp077 => _trdGrp077, trdGrp078 => _trdGrp078, trdGrp079 => _trdGrp079,
      trdGrp080 => _trdGrp080, trdGrp081 => _trdGrp081, trdGrp082 => _trdGrp082,
      trdGrp083 => _trdGrp083, trdGrp084 => _trdGrp084, trdGrp085 => _trdGrp085,
      trdGrp086 => _trdGrp086, trdGrp087 => _trdGrp087, trdGrp088 => _trdGrp088,
      trdGrp089 => _trdGrp089, trdGrp090 => _trdGrp090, trdGrp091 => _trdGrp091,
      trdGrp092 => _trdGrp092, trdGrp093 => _trdGrp093, trdGrp094 => _trdGrp094,
      trdGrp095 => _trdGrp095, trdGrp096 => _trdGrp096, trdGrp097 => _trdGrp097,
      trdGrp098 => _trdGrp098, trdGrp099 => _trdGrp099, trdGrp100 => _trdGrp100,
      trdGrp101 => _trdGrp101, trdGrp102 => _trdGrp102, trdGrp103 => _trdGrp103,
      trdGrp104 => _trdGrp104, trdGrp105 => _trdGrp105, trdGrp106 => _trdGrp106,
      trdGrp107 => _trdGrp107, trdGrp108 => _trdGrp108, trdGrp109 => _trdGrp109,
      trdGrp110 => _trdGrp110, trdGrp111 => _trdGrp111, trdGrp112 => _trdGrp112,
      trdGrp113 => _trdGrp113, trdGrp114 => _trdGrp114, trdGrp115 => _trdGrp115,
      trdGrp116 => _trdGrp116, trdGrp117 => _trdGrp117, trdGrp118 => _trdGrp118,
      trdGrp119 => _trdGrp119, trdGrp120 => _trdGrp120, trdGrp121 => _trdGrp121,
      trdGrp122 => _trdGrp122, trdGrp123 => _trdGrp123, trdGrp124 => _trdGrp124,
      trdGrp125 => _trdGrp125, trdGrp126 => _trdGrp126, trdGrp127 => _trdGrp127,
      trdGrp128 => _trdGrp128, trdGrp129 => _trdGrp129, trdGrp130 => _trdGrp130,
      trdGrp131 => _trdGrp131, trdGrp132 => _trdGrp132, trdGrp133 => _trdGrp133,
      trdGrp134 => _trdGrp134, trdGrp135 => _trdGrp135, trdGrp136 => _trdGrp136,
      trdGrp137 => _trdGrp137, trdGrp138 => _trdGrp138, trdGrp139 => _trdGrp139,
      trdGrp140 => _trdGrp140, trdGrp141 => _trdGrp141, trdGrp142 => _trdGrp142,
      trdGrp143 => _trdGrp143, trdGrp144 => _trdGrp144, trdGrp145 => _trdGrp145,
      trdGrp146 => _trdGrp146, trdGrp147 => _trdGrp147, trdGrp148 => _trdGrp148,
      trdGrp149 => _trdGrp149, trdGrp150 => _trdGrp150, trdGrp151 => _trdGrp151,
      trdGrp152 => _trdGrp152, trdGrp153 => _trdGrp153, trdGrp154 => _trdGrp154,
      trdGrp155 => _trdGrp155, trdGrp156 => _trdGrp156, trdGrp157 => _trdGrp157,
      trdGrp158 => _trdGrp158, trdGrp159 => _trdGrp159, trdGrp160 => _trdGrp160,
      trdGrp161 => _trdGrp161, trdGrp162 => _trdGrp162, trdGrp163 => _trdGrp163,
      trdGrp164 => _trdGrp164, trdGrp165 => _trdGrp165, trdGrp166 => _trdGrp166,
      trdGrp167 => _trdGrp167, trdGrp168 => _trdGrp168, trdGrp169 => _trdGrp169,
      trdGrp170 => _trdGrp170, trdGrp171 => _trdGrp171, trdGrp172 => _trdGrp172,
      trdGrp173 => _trdGrp173, trdGrp174 => _trdGrp174, trdGrp175 => _trdGrp175,
      trdGrp176 => _trdGrp176, trdGrp177 => _trdGrp177, trdGrp178 => _trdGrp178,
      trdGrp179 => _trdGrp179, trdGrp180 => _trdGrp180, trdGrp181 => _trdGrp181,
      trdGrp182 => _trdGrp182, trdGrp183 => _trdGrp183, trdGrp184 => _trdGrp184,
      trdGrp185 => _trdGrp185, trdGrp186 => _trdGrp186, trdGrp187 => _trdGrp187,
      trdGrp188 => _trdGrp188, trdGrp189 => _trdGrp189, trdGrp190 => _trdGrp190,
      trdGrp191 => _trdGrp191, trdGrp192 => _trdGrp192, trdGrp193 => _trdGrp193,
      trdGrp194 => _trdGrp194, trdGrp195 => _trdGrp195, trdGrp196 => _trdGrp196,
      trdGrp197 => _trdGrp197, trdGrp198 => _trdGrp198, trdGrp199 => _trdGrp199,
      trdGrp200 => _trdGrp200, trdGrp201 => _trdGrp201, trdGrp202 => _trdGrp202,
      trdGrp203 => _trdGrp203, trdGrp204 => _trdGrp204, trdGrp205 => _trdGrp205,
      trdGrp206 => _trdGrp206, trdGrp207 => _trdGrp207, trdGrp208 => _trdGrp208,
      trdGrp209 => _trdGrp209, trdGrp210 => _trdGrp210, trdGrp211 => _trdGrp211,
      trdGrp212 => _trdGrp212, trdGrp213 => _trdGrp213, trdGrp214 => _trdGrp214,
      trdGrp215 => _trdGrp215, trdGrp216 => _trdGrp216, trdGrp217 => _trdGrp217,
      trdGrp218 => _trdGrp218, trdGrp219 => _trdGrp219, trdGrp220 => _trdGrp220,
      trdGrp221 => _trdGrp221, trdGrp222 => _trdGrp222, trdGrp223 => _trdGrp223,
      trdGrp224 => _trdGrp224, trdGrp225 => _trdGrp225, trdGrp226 => _trdGrp226,
      trdGrp227 => _trdGrp227, trdGrp228 => _trdGrp228, trdGrp229 => _trdGrp229,
      trdGrp230 => _trdGrp230, trdGrp231 => _trdGrp231, trdGrp232 => _trdGrp232,
      trdGrp233 => _trdGrp233, trdGrp234 => _trdGrp234,
    };
}
