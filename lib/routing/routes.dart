// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class Routes {
  static const home = '/home';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const summaries = '/summaries';
  static const results = '/results';
  static const search = '/search';
  static const explore = '/explore';
  static const booking = '/booking';
  static const bookingRelative = 'booking';
  static String bookingWithId(int id) => '$booking/$id';
}
