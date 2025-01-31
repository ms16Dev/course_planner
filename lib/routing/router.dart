import 'package:go_router/go_router.dart';
import '../demo.dart';
import '../ui/home/home.dart';
import '../ui/account/account.dart';
import '../ui/mode/mode.dart';


final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => FluidNavBarDemo(),
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
  ],
);
