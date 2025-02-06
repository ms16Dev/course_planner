// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Simple Localizations similar to
/// https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization#an-alternative-class-for-the-apps-localized-resources
class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
    'summaries': 'Summaries',
    'addDates': 'Add Dates',
    'bookingDeleted': 'Booking deleted',
    'bookNewTrip': 'Book New Trip',
    'close': 'Close',
    'confirm': 'Confirm',
    'daytime': 'Daytime',
    'errorWhileDeletingBooking': 'Error while deleting booking',
    'errorWhileLoadingSummaries': 'Error while loading summaries',
    'errorWhileLoadingBooking': 'Error while loading booking',
    'errorWhileLoadingFields': 'Error while loading fields',
    'errorWhileLoadingSubjects': 'Error while loading subjects',
    'errorWhileLoadingHome': 'Error while loading home',
    'errorWhileLogin': 'Error while trying to login',
    'errorWhileLogout': 'Error while trying to logout',
    'errorWhileSavingSummaries': 'Error while saving summaries',
    'errorWhileSavingItinerary': 'Error while saving itinerary',
    'errorWhileSharing': 'Error while sharing booking',
    'evening': 'Evening',
    'login': 'Login',
    'nameTrips': '{name}\'s Trips',
    'search': 'Search',
    'searchSubject': 'Search subject',
    'selected': '{1} selected',
    'shareTrip': 'Share Trip',
    'tryAgain': 'Try again',
    'yourChosenSummaries': 'Your chosen summaries',
    'when': 'When',
  };

  // If string for "label" does not exist, will show "[LABEL]"
  static String _get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  String get summaries => _get('summaries');

  String get addDates => _get('addDates');

  String get confirm => _get('confirm');

  String get daytime => _get('daytime');

  String get errorWhileLoadingSummaries => _get('errorWhileLoadingSummaries');

  String get errorWhileLoadingBooking => _get('errorWhileLoadingBooking');

  String get errorWhileLoadingFields => _get('errorWhileLoadingContinents');

  String get errorWhileLoadingSubjects =>
      _get('errorWhileLoadingSubjects');

  String get errorWhileSavingSummaries => _get('errorWhileSavingSummaries');

  String get errorWhileSavingItinerary => _get('errorWhileSavingItinerary');

  String get evening => _get('evening');

  String get search => _get('search');

  String get searchSubject => _get('searchSubject');

  String get shareTrip => _get('shareTrip');

  String get tryAgain => _get('tryAgain');

  String get yourChosenSummaries => _get('yourChosenSummaries');

  String get when => _get('when');

  String get errorWhileLogin => _get('errorWhileLogin');

  String get login => _get('login');

  String get errorWhileLogout => _get('errorWhileLogout');

  String get close => _get('close');

  String get errorWhileSharing => _get('errorWhileSharing');

  String get bookNewTrip => _get('bookNewTrip');

  String get errorWhileLoadingHome => _get('errorWhileLoadingHome');

  String get bookingDeleted => _get('bookingDeleted');

  String get errorWhileDeletingBooking => _get('errorWhileDeletingBooking');

  String nameTrips(String name) => _get('nameTrips').replaceAll('{name}', name);

  String selected(int value) =>
      _get('selected').replaceAll('{1}', value.toString());
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
