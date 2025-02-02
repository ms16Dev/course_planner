// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

part 'field.g.dart';

@freezed
class Field with _$Field {
  const factory Field({
    /// e.g. 'Computer Science'
    required String name,

    /// e.g. 'https://rstr.in/google/tripedia/TmR12QdlVTT'
    required String imageUrl,
  }) = _Field;

  factory Field.fromJson(Map<String, Object?> json) =>
      _$FieldFromJson(json);
}
