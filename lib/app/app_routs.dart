import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/screens/splash_screen.dart';

class AppRouts {
  static Route<dynamic> routs(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    } else if (settings.name == HomeScreen.name) {
      screenWidget = HomeScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
