// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:logging/logging.dart';

import '../../../data/repositories/summary/summary_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/subject/subject_repository.dart';
import '../../../utils/result.dart';
import '../../models/summary/summarry.dart';
import '../../models/booking/booking.dart';
import '../../models/subject/subject.dart';
import '../../models/courseinfo/course_info.dart';

/// UseCase for creating [Booking] objects from [CourseInfo].
///
/// Fetches [Subject] and [Summary] objects from repositories,
/// checks if dates are set and creates a [Booking] object.
class BookingCreateUseCase {
  BookingCreateUseCase({
    required SubjectRepository subjectRepository,
    required SummaryRepository summaryRepository,
    required BookingRepository bookingRepository,
  })  : _subjectRepository = subjectRepository,
        _summaryRepository = summaryRepository,
        _bookingRepository = bookingRepository;

  final SubjectRepository _subjectRepository;
  final SummaryRepository _summaryRepository;
  final BookingRepository _bookingRepository;
  final _log = Logger('BookingCreateUseCase');

  /// Create [Booking] from a stored [CourseInfo]
  Future<Result<Booking>> createFrom(CourseInfo courseInfo) async {
    // Get Subject object from repository
    if (courseInfo.subject == null) {
      _log.warning('Subject is not set');
      return Result.error(Exception('Subject is not set'));
    }
    final subjectResult =
        await _fetchSubject(courseInfo.subject!);
    if (subjectResult is Error<Subject>) {
      _log.warning('Error fetching subject: ${subjectResult.error}');
      return Result.error(subjectResult.error);
    }
    _log.fine('Subject loaded: ${subjectResult.asOk.value.ref}');

    // Get Summary objects from repository
    if (courseInfo.summaries.isEmpty) {
      _log.warning('Activities are not set');
      return Result.error(Exception('Activities are not set'));
    }
    final summariesResult = await _summaryRepository.getBySubject(
      courseInfo.subject!,
    );
    if (summariesResult is Error<List<Summarry>>) {
      _log.warning('Error fetching summaries: ${summariesResult.error}');
      return Result.error(summariesResult.error);
    }
    final summaries = summariesResult.asOk.value
        .where(
          (summary) => courseInfo.summaries.contains(summary.ref),
        )
        .toList();
    _log.fine('Activities loaded (${summaries.length})');

    // Check if dates are set
    if (courseInfo.startDate == null || courseInfo.endDate == null) {
      _log.warning('Dates are not set');
      return Result.error(Exception('Dates are not set'));
    }

    final booking = Booking(
      startDate: courseInfo.startDate!,
      endDate: courseInfo.endDate!,
      subject: subjectResult.asOk.value,
      summary: summaries,
    );

    final saveBookingResult = await _bookingRepository.createBooking(booking);
    switch (saveBookingResult) {
      case Ok<void>():
        _log.fine('Booking saved successfully');
        break;
      case Error<void>():
        _log.warning('Failed to save booking', saveBookingResult.error);
        return Result.error(saveBookingResult.error);
    }

    // Create Booking object
    return Result.ok(booking);
  }

  Future<Result<Subject>> _fetchSubject(String subjectRef) async {
    final result = await _subjectRepository.getSubjects();
    switch (result) {
      case Ok<List<Subject>>():
        final subject = result.value
            .firstWhere((subject) => subject.ref == subjectRef);
        return Ok(subject);
      case Error<List<Subject>>():
        return Result.error(result.error);
    }
  }
}
