import 'package:flutter/material.dart';
import 'package:orders/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:orders/ui/auth/logout/widgets/logout_button.dart';
import 'package:provider/provider.dart';
import './ui/core/app_scroll_behavior.dart';

import './ui/home/home.dart';
import './ui/account/account.dart';
import './ui/mode/mode.dart';
import './ui/core/widgets/fluid_nav_bar.dart';

class FluidNavBarDemo extends StatefulWidget {
  @override
  State createState() {
    return _FluidNavBarDemoState();
  }
}

class _FluidNavBarDemoState extends State {
  Widget _child = HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF75B7E1),
      extendBody: true,
      appBar: AppBar(
        title: Text("My App"),
        actions: [
          LogoutButton(
            viewModel: LogoutViewModel(
              authRepository: context.read(), // Fix here
            ),
          ),
        ],
      ),
      body: _child,
      bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange),
    );
  }
  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = ModeContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
