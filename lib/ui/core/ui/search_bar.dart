// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../../domain/models/courseinfo/course_info.dart';
import '../localization/applocalization.dart';
import '../themes/colors.dart';
import '../themes/dimens.dart';
import 'date_format_start_end.dart';
import 'home_button.dart';

/// Application top search bar.
///
/// Displays a search bar with the current configuration.
/// Includes [HomeButton] to navigate back to the '/' path.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.config,
    this.onTap,
  });

  final CourseInfo? config;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: onTap,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey1),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingHorizontal,
                ),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: _QueryText(config: config),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const HomeButton(),
      ],
    );
  }
}

class _QueryText extends StatelessWidget {
  const _QueryText({
    required this.config,
  });

  final CourseInfo? config;

  @override
  Widget build(BuildContext context) {
    if (config == null) {
      return const _EmptySearch();
    }

    final CourseInfo(:field, :startDate, :endDate, :students) = config!;
    if (startDate == null ||
        endDate == null ||
        students == null ||
        field == null) {
      return const _EmptySearch();
    }

    return Text(
      '$field - ${dateFormatStartEnd(DateTimeRange(start: startDate, end: endDate))} - Guests: $students',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.search),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            AppLocalization.of(context).searchSubject,
            textAlign: TextAlign.start,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
        ),
      ],
    );
  }
}
