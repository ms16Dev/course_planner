// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../domain/models/courseinfo/course_info.dart';
import '../../../utils/result.dart';

/// Data source for the current [CourseInfo]
abstract class CourseInfoRepository {
  /// Get current [CourseInfo], may be empty if no configuration started.
  /// Method is async to support writing to database, file, etc.
  Future<Result<CourseInfo>> getCourseInfo();

  /// Sets [CourseInfo], overrides the previous one stored.
  /// Returns Result.Ok if set is successful.
  Future<Result<void>> setCourseInfo(CourseInfo itineraryConfig);
}
