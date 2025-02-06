import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:orders/ui/auth/logout/widgets/logout_button.dart';
import 'package:orders/ui/core/widgets/fluid_nav_bar.dart';
import 'package:provider/provider.dart';

class FluidNavBarDemo extends StatelessWidget {
  final Widget child;

  const FluidNavBarDemo({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF75B7E1),
      extendBody: true,
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          LogoutButton(
            viewModel: LogoutViewModel(
              authRepository: context.read(),
              courseInfoRepository: context.read(),
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: child,
      ),
      bottomNavigationBar: FluidNavBar(
        onChange: (index) => _handleNavigationChange(context, index),
      ),
    );
  }

  /// Determines the selected index based on the current route
  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == '/home') return 0;
    if (location == '/account') return 1;
    if (location == '/mode') return 2;
    return 0;
  }

  /// Handles navigation using GoRouter
  void _handleNavigationChange(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/account');
        break;
      case 2:
        context.go('/explore');
        break;
    }
  }
}
