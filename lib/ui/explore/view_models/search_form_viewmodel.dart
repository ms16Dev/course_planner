// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/field/field_repository.dart';
import '../../../data/repositories/courseinfo/course_info_repository.dart';
import '../../../domain/models/field/field.dart';
import '../../../domain/models/courseinfo/course_info.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

/// View model for the search form.
///
/// Contains the form selected options
/// and the logic to load the list of regions.
class SearchFormViewModel extends ChangeNotifier {
  SearchFormViewModel({
    required FieldRepository fieldRepository,
    required CourseInfoRepository courseInfoRepository,
  })  : _fieldRepository = fieldRepository,
        _courseInfoRepository = courseInfoRepository {
    updateCourseInfo = Command0(_updateCourseInfo);
    load = Command0(_load)..execute();
  }

  final _log = Logger('SearchFormViewModel');
  final FieldRepository _fieldRepository;
  final CourseInfoRepository _courseInfoRepository;
  List<Field> _fields = [];
  String? _selectedField;
  DateTimeRange? _dateRange;
  int _students = 0;

  /// True if the form is valid and can be submitted
  bool get valid =>
      _students > 0 && _selectedField != null && _dateRange != null;

  /// List of fields.
  /// Loaded in [load] command.
  List<Field> get fields => _fields;

  /// Selected field.
  /// Null means no field is selected.
  String? get selectedField => _selectedField;

  /// Set selected field.
  /// Set to null to clear the selection.
  set selectedField(String? field) {
    _selectedField = field;
    _log.finest('Selected field: $field');
    notifyListeners();
  }

  /// Date range.
  /// Null means no range is selected.
  DateTimeRange? get dateRange => _dateRange;

  /// Set date range.
  /// Can be set to null to clear selection.
  set dateRange(DateTimeRange? dateRange) {
    _dateRange = dateRange;
    _log.finest('Selected date range: $dateRange');
    notifyListeners();
  }

  /// Number of students
  int get students => _students;

  /// Set number of students
  /// If the quantity is negative, it will be set to 0
  set students(int quantity) {
    if (quantity < 0) {
      _students = 0;
    } else {
      _students = quantity;
    }
    _log.finest('Set students number: $_students');
    notifyListeners();
  }

  /// Load the list of fields and current itinerary config.
  late final Command0 load;

  /// Store ViewModel data into [CourseInfoRepository] before navigating.
  late final Command0 updateCourseInfo;

  Future<Result<void>> _load() async {
    final result = await _loadFields();
    if (result is Error) {
      return result;
    }
    return await _loadCourseInfo();
  }

  Future<Result<void>> _loadFields() async {
    final result = await _fieldRepository.getFields();
    switch (result) {
      case Ok():
        {
          _fields = result.value;
          _log.fine('Fields (${_fields.length}) loaded');
        }
      case Error():
        {
          _log.warning('Failed to load fields', result.asError.error);
        }
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _loadCourseInfo() async {
    final result = await _courseInfoRepository.getCourseInfo();
    switch (result) {
      case Ok<CourseInfo>():
        {
          final courseInfo = result.value;
          _selectedField = courseInfo.field;
          if (courseInfo.startDate != null &&
              courseInfo.endDate != null) {
            _dateRange = DateTimeRange(
              start: courseInfo.startDate!,
              end: courseInfo.endDate!,
            );
          }
          _students = courseInfo.students ?? 0;
          _log.fine('CourseInfo loaded');
          notifyListeners();
        }
      case Error<CourseInfo>():
        {
          _log.warning(
            'Failed to load stored CourseInfo',
            result.asError.error,
          );
        }
    }
    return result;
  }

  Future<Result<void>> _updateCourseInfo() async {
    assert(valid, "called when valid was false");
    final result = await _courseInfoRepository.setCourseInfo(
      CourseInfo(
        field: _selectedField,
        startDate: _dateRange!.start,
        endDate: _dateRange!.end,
        students: _students,
      ),
    );
    switch (result) {
      case Ok<void>():
        _log.fine('CourseInfo saved');
      case Error<void>():
        _log.warning('Failed to store CourseInfo', result.error);
    }
    return result;
  }
}
