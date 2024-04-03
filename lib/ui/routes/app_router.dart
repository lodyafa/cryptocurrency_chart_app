import 'package:cryptocurrency_chart_app/ui/routes/app_routes.dart';
import 'package:cryptocurrency_chart_app/ui/screens/auth_screen.dart';
import 'package:cryptocurrency_chart_app/ui/screens/branches_switcher_screen.dart';
import 'package:cryptocurrency_chart_app/ui/screens/home_screen.dart';
import 'package:cryptocurrency_chart_app/ui/screens/route_error_screen.dart';
import 'package:cryptocurrency_chart_app/ui/screens/screen_loader.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    errorBuilder: (context, state) => const RouteErrorScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.screenLoader,
        builder: ((context, state) => const ScreenLoader()),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: ((context, state) => const AuthScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BranchesSwitcherScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.account,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}