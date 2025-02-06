// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:orders/data/repositories/courseinfo/course_info_repository.dart';

import '../../../../data/repositories/auth/auth_repository.dart';

import '../../../../domain/models/courseinfo/course_info.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LogoutViewModel {
  LogoutViewModel({
    required AuthRepository authRepository,
    required CourseInfoRepository courseInfoRepository,

  })  : _authLogoutRepository = authRepository,
        _courseInfoRepository = courseInfoRepository {
    logout = Command0(_logout);
  }
  final AuthRepository _authLogoutRepository;
  final CourseInfoRepository _courseInfoRepository;
  late Command0 logout;

  Future<Result> _logout() async {
    var result = await _authLogoutRepository.logout();
    switch (result) {
      case Ok<void>():
        // clear stored course info
        return _courseInfoRepository
            .setCourseInfo(const CourseInfo());

      case Error<void>():
        return result;
    }
  }
}
