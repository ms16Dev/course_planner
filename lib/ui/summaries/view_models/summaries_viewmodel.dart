// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/summary/summary_repository.dart';
import '../../../data/repositories/courseinfo/course_info_repository.dart';
import '../../../domain/models/summary/summarry.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class SummariesViewModel extends ChangeNotifier {
  SummariesViewModel({
    required SummaryRepository summaryRepository,
    required CourseInfoRepository courseInfoRepository,
  })  : _summaryRepository = summaryRepository,
        _courseInfoRepository = courseInfoRepository {
    loadSummaries = Command0(_loadSummaries)..execute();
    saveSummaries = Command0(_saveSummaries);
  }

  final _log = Logger('SummariesViewModel');
  final SummaryRepository _summaryRepository;
  final CourseInfoRepository _courseInfoRepository;
  List<Summarry> _summaries = <Summarry>[];
  final Set<String> _selectedSummaries = <String>{};

  /// List of daytime [Summary] per destination.
  List<Summarry> get summaries => _summaries;

  /// Selected [Summary] by ref.
  Set<String> get selectedSummaries => _selectedSummaries;

  /// Load list of [Summary] for a [Destination] by ref.
  late final Command0 loadSummaries;

  /// Save list [selectedSummaries] into itinerary configuration.
  late final Command0 saveSummaries;

  Future<Result<void>> _loadSummaries() async {
    final result = await _courseInfoRepository.getCourseInfo();
    if (result is Error) {
      _log.warning(
        'Failed to load stored ItineraryConfig',
        result.asError.error,
      );
      return result;
    }

    final destinationRef = result.asOk.value.subject;
    if (destinationRef == null) {
      _log.severe('Destination missing in ItineraryConfig');
      return Result.error(Exception('Destination not found'));
    }

    _selectedSummaries.addAll(result.asOk.value.summaries);

    final resultSummaries =
        await _summaryRepository.getBySubject(destinationRef);

    _summaries = resultSummaries.asOk.value;
    notifyListeners();
    return resultSummaries;
  }

  /// Add [Summary] to selected list.
  void addSummary(String summarryRef) {

    _selectedSummaries.add(summarryRef);
    _log.finest('Summary $summarryRef added');
    notifyListeners();
  }

  /// Remove [Summary] from selected list.
  void removeSummary(String summarryRef) {

    _selectedSummaries.remove(summarryRef);
    _log.finest('Summary $summarryRef removed');
    notifyListeners();
  }

  Future<Result<void>> _saveSummaries() async {
    final resultConfig = await _courseInfoRepository.getCourseInfo();
    if (resultConfig is Error) {
      _log.warning(
        'Failed to load stored ItineraryConfig',
        resultConfig.asError.error,
      );
      return resultConfig;
    }

    final itineraryConfig = resultConfig.asOk.value;
    final result = await _courseInfoRepository.setCourseInfo(
        itineraryConfig.copyWith(summaries: _selectedSummaries.toList()));
    if (result is Error) {
      _log.warning(
        'Failed to store ItineraryConfig',
        result.asError.error,
      );
    }
    return result;
  }
}
