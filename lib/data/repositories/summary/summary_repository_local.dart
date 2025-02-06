// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../domain/models/summary/summarry.dart';
import '../../../utils/result.dart';
import '../../services/local/local_data_service.dart';
import 'summary_repository.dart';

/// Local implementation of SummaryRepository
/// Uses data from assets folder
class SummaryRepositoryLocal implements SummaryRepository {
  SummaryRepositoryLocal({
    required LocalDataService localDataService,
  }) : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Summarry>>> getBySubject(String ref) async {
    try {
      final summaries = (await _localDataService.getSummaries())
          .where((summarry) => summarry.subjectRef == ref)
          .toList();

      return Result.ok(summaries);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
