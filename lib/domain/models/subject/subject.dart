// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';

part 'subject.g.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    /// e.g. 'math102'
    required String ref,

    /// e.g. 'Mathematics 102'
    required String name,

    /// e.g. 'Computer Science'
    required String field,

    /// e.g. 'Basic CS mathematics  ...'
    required String description,

    /// e.g. ['Algebra', 'Matrices', 'Numerical Analysis']
    required List<String> tags,

    /// e.g. 'https://storage.googleapis.com/tripedia-images/subjects/alaska.jpg'
    required String imageUrl,
  }) = _Subject;

  factory Subject.fromJson(Map<String, Object?> json) =>
      _$SubjectFromJson(json);
}
