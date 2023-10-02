import 'package:duqing/ui/pages/auth/login/login_page.dart';
import 'package:duqing/ui/pages/auth/register/register_page.dart';
import 'package:duqing/ui/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';

  static final router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}
