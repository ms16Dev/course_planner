// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../domain/models/subject/subject.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'subject_repository.dart';

/// Local implementation of SubjectRepository
/// Uses data from assets folder
class SubjectRepositoryLocal implements SubjectRepository {
  SubjectRepositoryLocal({
    required LocalDataService localDataService,
  }) : _localDataService = localDataService;

  final LocalDataService _localDataService;

  /// Obtain list of subjects from local assets
  @override
  Future<Result<List<Subject>>> getSubjects() async {
    try {
      return Result.ok(await _localDataService.getSubjects());
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
