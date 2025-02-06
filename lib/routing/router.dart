import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:orders/routing/routes.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../main_screen.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/booking/view_models/booking_viewmodel.dart';
import '../ui/booking/widgets/booking_screen.dart';
import '../ui/explore/view_models/search_form_viewmodel.dart';
import '../ui/explore/widgets/search_form_screen.dart';
import '../ui/account/account.dart';
import 'package:provider/provider.dart';

import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/results/view_models/results_viewmodel.dart';
import '../ui/results/widgets/results_screen.dart';
import '../ui/summaries/view_models/summaries_viewmodel.dart';
import '../ui/summaries/widgets/summaries_screen.dart';


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
          builder: (context, state) {
            final viewModel = HomeViewModel(
              bookingRepository: context.read(),
              userRepository: context.read(),
            );
            return HomeScreen(viewModel: viewModel);
          },        ),
        GoRoute(
        path: '/account',
        builder: (context, state) => AccountContent(),
        ),
        GoRoute(
        path: '/explore',
          builder: (context, state) {
            final viewModel = SearchFormViewModel(
              fieldRepository: context.read(),
              courseInfoRepository: context.read(),
            );
            return SearchFormScreen(viewModel: viewModel);
          },
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
    GoRoute(
      path: Routes.results,
      builder: (context, state) {
        final viewModel = ResultsViewModel(
          subjectRepository: context.read(),
          courseInfoRepository: context.read(),
        );
        return ResultsScreen(
          viewModel: viewModel,
        );
      },
    ),
    GoRoute(
      path: Routes.summaries,
      builder: (context, state) {
        final viewModel = SummariesViewModel(
          summaryRepository: context.read(),
          courseInfoRepository: context.read(),
        );
        return SummariesScreen(
          viewModel: viewModel,
        );
      },
    ),
    GoRoute(
      path: Routes.booking,
      builder: (context, state) {
        final viewModel = BookingViewModel(
          courseInfoRepository: context.read(),
          createBookingUseCase: context.read(),
          shareBookingUseCase: context.read(),
          bookingRepository: context.read(),
        );

        // When opening the booking screen directly
        // create a new booking from the stored ItineraryConfig.
        viewModel.createBooking.execute();

        return BookingScreen(
          viewModel: viewModel,
        );
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            final viewModel = BookingViewModel(
              courseInfoRepository: context.read(),
              createBookingUseCase: context.read(),
              shareBookingUseCase: context.read(),
              bookingRepository: context.read(),
            );

            // When opening the booking screen with an existing id
            // load and display that booking.
            viewModel.loadBooking.execute(id);

            return BookingScreen(
              viewModel: viewModel,
            );
          },
        ),
      ],
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
