import 'package:oivan_app/src/features/sof/presentation/screens/sof_user_details_screen.dart';

import '../../../features/sof/presentation/screens/sof_users_screen.dart';
import 'route_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final GoRouter router = GoRouter(
      initialLocation: RouteStrings.sofUsersPageString,
      navigatorKey: navigatorKey,
      observers: [
        routeObserver
      ],
      routes: [
        GoRoute(
            path: RouteStrings.sofUsersPageString,
            builder: (c, state) => const SOFUsersScreen()),
        GoRoute(
            path: RouteStrings.sofUserDetailsPageString,
            builder: (c, state) => SOFUserDetailsScreen(
                  userID: state.extra as String,
                ))
      ]);
}
