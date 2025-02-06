// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/summary/summarry.dart';
import '../../../utils/image_error_listener.dart';
import '../../core/themes/dimens.dart';
import '../view_models/booking_viewmodel.dart';
import 'booking_header.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({
    super.key,
    required this.viewModel,
  });

  final BookingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final booking = viewModel.booking;
        if (booking == null) return const SizedBox();
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: BookingHeader(booking: booking)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final summary = booking.summary[index];
                  return _Summary(summary: summary);
                },
                childCount: booking.summary.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 200)),
          ],
        );
      },
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({
    required this.summary,
  });

  final Summarry summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.paddingVertical,
        left: Dimens.of(context).paddingScreenHorizontal,
        right: Dimens.of(context).paddingScreenHorizontal,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: summary.imageUrl,
              height: 80,
              width: 80,
              errorListener: imageErrorListener,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  summary.title.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  summary.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  summary.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
