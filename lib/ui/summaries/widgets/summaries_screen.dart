// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/summaries_viewmodel.dart';
import 'summaries_header.dart';
import 'summaries_list.dart';
import 'summaries_title.dart';

const String confirmButtonKey = 'confirm-button';

class SummariesScreen extends StatefulWidget {
  const SummariesScreen({
    super.key,
    required this.viewModel,
  });

  final SummariesViewModel viewModel;

  @override
  State<SummariesScreen> createState() => _SummariesScreenState();
}

class _SummariesScreenState extends State<SummariesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.saveSummaries.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SummariesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.saveSummaries.removeListener(_onResult);
    widget.viewModel.saveSummaries.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.saveSummaries.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, r) {
        if (!didPop) context.go(Routes.results);
      },
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewModel.loadSummaries,
          builder: (context, child) {
            if (widget.viewModel.loadSummaries.completed) {
              return child!;
            }
            return Column(
              children: [
                const SummariesHeader(),
                if (widget.viewModel.loadSummaries.running)
                  const Expanded(
                      child: Center(child: CircularProgressIndicator())),
                if (widget.viewModel.loadSummaries.error)
                  Expanded(
                    child: Center(
                      child: ErrorIndicator(
                        title: AppLocalization.of(context)
                            .errorWhileLoadingSummaries,
                        label: AppLocalization.of(context).tryAgain,
                        onPressed: widget.viewModel.loadSummaries.execute,
                      ),
                    ),
                  ),
              ],
            );
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SummariesHeader(),
                        ),
                        SummariesTitle(
                          viewModel: widget.viewModel,
                        ),
                        SummariesList(
                          viewModel: widget.viewModel,
                        ),
                        SummariesTitle(
                          viewModel: widget.viewModel,
                        ),
                        SummariesList(
                          viewModel: widget.viewModel,
                        ),
                      ],
                    ),
                  ),
                  _BottomArea(viewModel: widget.viewModel),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.saveSummaries.completed) {
      widget.viewModel.saveSummaries.clearResult();
      context.go(Routes.booking);
    }

    if (widget.viewModel.saveSummaries.error) {
      widget.viewModel.saveSummaries.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.of(context).errorWhileSavingSummaries),
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed: widget.viewModel.saveSummaries.execute,
          ),
        ),
      );
    }
  }
}

class _BottomArea extends StatelessWidget {
  const _BottomArea({
    required this.viewModel,
  });

  final SummariesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Material(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimens.of(context).paddingScreenHorizontal,
            right: Dimens.of(context).paddingScreenVertical,
            top: Dimens.paddingVertical,
            bottom: Dimens.of(context).paddingScreenVertical,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.of(context)
                    .selected(viewModel.selectedSummaries.length),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              FilledButton(
                key: const Key(confirmButtonKey),
                onPressed: viewModel.selectedSummaries.isNotEmpty
                    ? viewModel.saveSummaries.execute
                    : null,
                child: Text(AppLocalization.of(context).confirm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
