import 'package:voltway_mobile/app/auth/login/screens/login.dart';
import 'package:voltway_mobile/app/auth/registration/screens/registration.dart';
import 'package:voltway_mobile/app/home/screens/home.dart';
import 'package:voltway_mobile/app/welcome/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

class RoutingConfiguration {
  static final routes = GoRouter(
    initialLocation: "/welcome",
    routes: [
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Welcome(),
        ),
      ),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Home(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Login(),
        ),
      ),
      GoRoute(
        path: '/registration',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const Registration(),
        ),
      ),
    ],
  );
}
