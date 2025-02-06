// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/courseinfo/course_info_repository.dart';
import '../../../domain/models/booking/booking.dart';
import '../../../domain/models/courseinfo/course_info.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
import '../../../domain/use_cases/booking/booking_create_use_case.dart';
import '../../../domain/use_cases/booking/booking_share_use_case.dart';

class BookingViewModel extends ChangeNotifier {
  BookingViewModel({
    required BookingCreateUseCase createBookingUseCase,
    required BookingShareUseCase shareBookingUseCase,
    required CourseInfoRepository courseInfoRepository,
    required BookingRepository bookingRepository,
  })  : _createUseCase = createBookingUseCase,
        _shareUseCase = shareBookingUseCase,
        _courseInfoRepository = courseInfoRepository,
        _bookingRepository = bookingRepository {
    createBooking = Command0(_createBooking);
    shareBooking = Command0(() => _shareUseCase.shareBooking(_booking!));
    loadBooking = Command1(_load);
  }

  final BookingCreateUseCase _createUseCase;
  final BookingShareUseCase _shareUseCase;
  final CourseInfoRepository _courseInfoRepository;
  final BookingRepository _bookingRepository;
  final _log = Logger('BookingViewModel');
  Booking? _booking;

  Booking? get booking => _booking;

  /// Creates a booking from the CourseInfo
  /// and saves it to the user bookins
  late final Command0 createBooking;

  /// Loads booking by id
  late final Command1<void, int> loadBooking;

  /// Share the current booking using the OS share dialog.
  late final Command0 shareBooking;

  Future<Result<void>> _createBooking() async {
    _log.fine('Loading booking');
    final courseInfo =
        await _courseInfoRepository.getCourseInfo();
    switch (courseInfo) {
      case Ok<CourseInfo>():
        _log.fine('Loaded stored CourseInfo');
        final result = await _createUseCase.createFrom(courseInfo.value);
        switch (result) {
          case Ok<Booking>():
            _log.fine('Created Booking');
            _booking = result.value;
            notifyListeners();
            return Result.ok(null);
          case Error<Booking>():
            _log.warning('Booking error: ${result.error}');
            notifyListeners();
            return Result.error(result.asError.error);
        }
      case Error<CourseInfo>():
        _log.warning('CourseInfo error: ${courseInfo.error}');
        notifyListeners();
        return Result.error(courseInfo.error);
    }
  }

  Future<Result<void>> _load(int id) async {
    final result = await _bookingRepository.getBooking(id);
    switch (result) {
      case Ok<Booking>():
        _log.fine('Loaded booking $id');
        _booking = result.value;
        notifyListeners();
      case Error<Booking>():
        _log.warning('Failed to load booking $id');
    }
    return result;
  }
}
