// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:logging/logging.dart';

import '../../../data/repositories/subject/subject_repository.dart';
import '../../../data/repositories/courseinfo/course_info_repository.dart';
import '../../../domain/models/subject/subject.dart';
import '../../../domain/models/courseinfo/course_info.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import 'package:flutter/cupertino.dart';

/// Results screen view model
/// Based on https://docs.flutter.dev/get-started/fwe/state-management#using-mvvm-for-your-applications-architecture
class ResultsViewModel extends ChangeNotifier {
  ResultsViewModel({
    required SubjectRepository subjectRepository,
    required CourseInfoRepository itineraryConfigRepository,
  })  : _subjectRepository = subjectRepository,
        _itineraryConfigRepository = itineraryConfigRepository {
    updateCourseInfo = Command1<void, String>(_updateCourseInfo);
    search = Command0(_search)..execute();
  }

  final _log = Logger('ResultsViewModel');

  final SubjectRepository _subjectRepository;

  final CourseInfoRepository _itineraryConfigRepository;

  // Setters are private
  List<Subject> _subjects = [];

  /// List of subjects, may be empty but never null
  List<Subject> get subjects => _subjects;

  CourseInfo? _itineraryConfig;

  /// Filter options to display on search bar
  CourseInfo get config => _itineraryConfig ?? const CourseInfo();

  /// Perform search
  late final Command0 search;

  /// Store ViewModel data into [CourseInfoRepository] before navigating.
  late final Command1<void, String> updateCourseInfo;

  Future<Result<void>> _search() async {
    // Load current itinerary config
    final resultConfig = await _itineraryConfigRepository.getCourseInfo();
    if (resultConfig is Error) {
      _log.warning(
        'Failed to load stored CourseInfo',
        resultConfig.asError.error,
      );
      return resultConfig;
    }
    _itineraryConfig = resultConfig.asOk.value;
    notifyListeners();

    final result = await _subjectRepository.getSubjects();
    switch (result) {
      case Ok():
        {
          // If the result is Ok, update the list of subjects
          _subjects = result.value
              .where((subject) =>
                  subject.field == _itineraryConfig!.field)
              .toList();
          _log.fine('Subjects (${_subjects.length}) loaded');
        }
      case Error():
        {
          _log.warning('Failed to load subjects', result.error);
        }
    }

    // After finish loading results, notify the view
    notifyListeners();
    return result;
  }

  Future<Result<void>> _updateCourseInfo(String subjectRef) async {
    assert(subjectRef.isNotEmpty, "subjectRef should not be empty");

    final resultConfig = await _itineraryConfigRepository.getCourseInfo();
    if (resultConfig is Error) {
      _log.warning(
        'Failed to load stored CourseInfo',
        resultConfig.asError.error,
      );
      return resultConfig;
    }

    final itineraryConfig = resultConfig.asOk.value;
    final result = await _itineraryConfigRepository
        .setCourseInfo(itineraryConfig.copyWith(
      subject: subjectRef,
      summaries: [],
    ));
    if (result is Error) {
      _log.warning(
        'Failed to store CourseInfo',
        result.asError.error,
      );
    }
    return result;
  }
}
