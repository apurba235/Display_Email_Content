import 'dart:async';
import 'package:coffebeans_assignments/presentation/home/home.dart';
import 'package:coffebeans_assignments/presentation/mail_content/mail_content.dart';
import 'package:coffebeans_assignments/presentation/route_error/route_error.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

class Nav {
  static final GoRouter goRoutes = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => RouteErrorScreen(error: state.error),
    routes: [
      CustomTransitionRoute(
        name: _Path.home,
        nameAlt: _Path.home,
        page: (context, state) => HomeScreen(),
        routes: [
          CustomTransitionRoute(
            name: _Path.mailContent,
            page: (context, state) => MailContent(mailContentNumber: int.parse(state.queryParameters['id'] ?? '0')),
          )
        ],
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
GoRoute CustomTransitionRoute(
    {required String name,
    required Widget Function(BuildContext, GoRouterState)? page,
    String? nameAlt,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    List<RouteBase> routes = const <RouteBase>[]}) {
  return GoRoute(
    path: name,
    name: nameAlt,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: page!.call(context, state),
        transitionDuration: const Duration(milliseconds: 50),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      );
    },
    parentNavigatorKey: parentNavigatorKey,
    redirect: redirect,
    routes: routes,
  );
}
