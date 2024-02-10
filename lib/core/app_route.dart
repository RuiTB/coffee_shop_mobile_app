import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/dependencies_injection.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/login/login_page.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/cubit/register_cubit.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/register/register_page.dart';
import 'package:flutter_clean_architecture_template/features/auth/pages/wid.dart';
import 'package:flutter_clean_architecture_template/main.dart';
import 'package:flutter_clean_architecture_template/utils/helper/go_router_refresh_stream.dart';
import 'package:flutter_clean_architecture_template/utils/services/hive/main_box.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  root("/"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        builder: (_, __) => const MyWidget(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => LoginPage(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
          child: RegisterPage(),
        ),
      ),
    ],
    initialLocation: Routes.root.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
