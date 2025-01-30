import 'package:flutter/material.dart';
import './ui/app_scroll_behavior.dart';

import './demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: FluidNavBarDemo(),
    );
  }
}