// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'summarry.freezed.dart';

part 'summarry.g.dart';


@freezed
class Summarry with _$Summarry {
  const factory Summarry({
    /// e.g. 'Basics of Computer Science'
    required String title,

    /// e.g. 'Embark on a thrilling adventure exploring the awe-inspiring glaciers of Alaska. Hike across the icy terrain, marvel at the deep blue crevasses, and even try your hand at ice climbing for an unforgettable experience.'
    required String description,

    /// Duration in days.
    /// e.g. 8
    required int duration,

    /// e.g. 4
    required int credits,

    /// e.g. 'math102'
    required String subjectRef,

    /// e.g. 'basics-of-computer-science'
    required String ref,

    /// e.g. 'https://storage.googleapis.com/tripedia-images/activities/alaska_glacier-trekking-and-ice-climbing.jpg'
    required String imageUrl,
  }) = _Summarry;

  factory Summarry.fromJson(Map<String, Object?> json) =>
      _$SummarryFromJson(json);
}
