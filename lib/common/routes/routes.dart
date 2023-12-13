import 'package:chaten/feature/welcome/pages/auth/pages/loginPage.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/userInfoPage.dart';
import 'package:chaten/feature/welcome/pages/auth/pages/verificationPage.dart';
import 'package:chaten/feature/welcome/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-Info';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            verificationId: args['verificationId'],
            phoneNumber: args['phoneNumber'],
          ),
        );
      case userInfo:
        return MaterialPageRoute(
          builder: (context) => const UserInfoPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Page Route Provided'),
                  ),
                ));
    }
  }
}
