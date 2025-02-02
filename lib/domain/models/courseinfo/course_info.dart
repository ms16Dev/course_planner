// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_info.freezed.dart';

part 'course_info.g.dart';

@freezed
class CourseInfo with _$CourseInfo {
  const factory CourseInfo({
    /// [Field] name
    String? field,

    /// Start date (check in) of course
    DateTime? startDate,

    /// End date (check out) of course
    DateTime? endDate,

    /// Number of students
    int? students,

    /// Selected [Subject] reference
    String? subject,

    /// Selected [Summary] references
    @Default([]) List<String> summaries,
  }) = _CourseInfo;

  factory CourseInfo.fromJson(Map<String, Object?> json) =>
      _$CourseInfoFromJson(json);
}
