// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'ui/core/localization/applocalization.dart';
import 'ui/core/themes/theme.dart';
import 'routing/router.dart';
import 'package:flutter/material.dart';

import 'ui/core/app_scroll_behavior.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providersLocal, // Ensure AuthRepository is provided
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          localizationsDelegates: [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            AppLocalizationDelegate(),
          ],
          scrollBehavior: AppScrollBehavior(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: router(context.read()), // Fix here
        );
      },
    );
  }
}

