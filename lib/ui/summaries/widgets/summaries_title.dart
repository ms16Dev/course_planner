// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../core/localization/applocalization.dart';
import '../../core/themes/dimens.dart';
import '../view_models/summaries_viewmodel.dart';

class SummariesTitle extends StatelessWidget {
  const SummariesTitle({
    super.key,
    required this.viewModel,
  });

  final SummariesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final list = viewModel.summaries;
    if (list.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimens.of(context).edgeInsetsScreenHorizontal,
        child: Text("_label(context)"),
      ),
    );
  }


}
