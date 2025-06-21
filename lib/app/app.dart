import 'package:crafty_bay/app/app_routs.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      theme: AppTheme.lightThemeData,
      onGenerateRoute: AppRouts.routs,
    );
  }
}
