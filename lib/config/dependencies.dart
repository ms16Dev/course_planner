// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_repository_dev.dart';



/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(
      value: AuthRepositoryDev() as AuthRepository,
    ),
  ];
}
