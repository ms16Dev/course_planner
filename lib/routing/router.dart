import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/routing/routes.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../main_screen.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/home/home.dart';
import '../ui/account/account.dart';
import '../ui/mode/mode.dart';
import 'package:provider/provider.dart';


GoRouter router(
    AuthRepository authRepository,
    ) =>
GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    ShellRoute(
    builder: (context, state, child) => FluidNavBarDemo(child: child),
      routes: [
        GoRoute(
        path: '/home',
        builder: (context, state) => HomeContent(),
        ),
        GoRoute(
        path: '/account',
        builder: (context, state) => AccountContent(),
        ),
        GoRoute(
        path: '/mode',
        builder: (context, state) => ModeContent(),
        ),
      ],
      ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(
        viewModel: LoginViewModel(
          authRepository: context.read(),
        ),
      ),
    ),
  ],
);


// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final bool loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final bool loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
