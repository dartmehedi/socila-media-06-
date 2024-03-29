import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/dashboard/dashboard_screen.dart';
import 'package:tech_media/view/forgot_password/forgot_password.dart';
import 'package:tech_media/view/splash/splash_screen.dart';

import '../../view/login/login_screen.dart';
import '../../view/signup/sign_up_screen.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteName.forgotScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_)=> const DashboardScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

