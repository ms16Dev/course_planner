// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import '../../../domain/models/courseinfo/course_info.dart';
import '../../../utils/result.dart';
import 'course_info_repository.dart';

/// In-memory implementation of [CourseInfoRepository].
class CourseInfoRepositoryMemory implements CourseInfoRepository {
  CourseInfo? _itineraryConfig;

  @override
  Future<Result<CourseInfo>> getCourseInfo() async {
    return Result.ok(_itineraryConfig ?? const CourseInfo());
  }

  @override
  Future<Result<bool>> setCourseInfo(
    CourseInfo itineraryConfig,
  ) async {
    _itineraryConfig = itineraryConfig;
    return Result.ok(true);
  }
}
