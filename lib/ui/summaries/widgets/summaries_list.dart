// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:orders/ui/summaries/widgets/summary_entry.dart';

import '../../core/themes/dimens.dart';
import '../view_models/summaries_viewmodel.dart';

class SummariesList extends StatelessWidget {
  const SummariesList({
    super.key,
    required this.viewModel,
  });

  final SummariesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final list = viewModel.summaries;
    return SliverPadding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical,
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
        bottom: Dimens.paddingVertical,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final summarry = list[index];
            return Padding(
              padding:
                  EdgeInsets.only(bottom: index < list.length - 1 ? 20 : 0),
              child: SummaryEntry(
                key: ValueKey(summarry.ref),
                summarry: summarry,
                selected: viewModel.selectedSummaries.contains(summarry.ref),
                onChanged: (value) {
                  if (value!) {
                    viewModel.addSummary(summarry.ref);
                  } else {
                    viewModel.removeSummary(summarry.ref);
                  }
                },
              ),
            );
          },
          childCount: list.length,
        ),
      ),
    );
  }
}
