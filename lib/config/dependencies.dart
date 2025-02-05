// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_repository_dev.dart';
import '../data/repositories/booking/booking_repository.dart';
import '../data/repositories/booking/booking_repository_local.dart';
import '../data/repositories/courseinfo/course_info_repository.dart';
import '../data/repositories/courseinfo/course_info_repository_memory.dart';
import '../data/repositories/field/field_repository.dart';
import '../data/repositories/field/field_repository_local.dart';
import '../data/repositories/subject/subject_repository.dart';
import '../data/repositories/subject/subject_repository_local.dart';
import '../data/repositories/summary/summary_repository.dart';
import '../data/repositories/summary/summary_repository_local.dart';
import '../data/repositories/user/user_repository.dart';
import '../data/repositories/user/user_repository_local.dart';
import '../data/services/local/local_data_service.dart';



/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(
      value: AuthRepositoryDev() as AuthRepository,
    ),
    Provider.value(
      value: LocalDataService(),
    ),
    Provider(
      create: (context) => SubjectRepositoryLocal(
        localDataService: context.read(),
      ) as SubjectRepository,
    ),
    Provider(
      create: (context) => FieldRepositoryLocal(
        localDataService: context.read(),
      ) as FieldRepository,
    ),
    Provider(
      create: (context) => SummaryRepositoryLocal(
        localDataService: context.read(),
      ) as SummaryRepository,
    ),
    Provider(
      create: (context) => BookingRepositoryLocal(
        localDataService: context.read(),
      ) as BookingRepository,
    ),
    Provider.value(
      value: CourseInfoRepositoryMemory() as CourseInfoRepository,
    ),
    Provider(
      create: (context) => UserRepositoryLocal(
        localDataService: context.read(),
      ) as UserRepository,
    ),
  ];
}
