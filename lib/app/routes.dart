import 'package:flutter/cupertino.dart';
import 'package:furniturezoid/screen/dashboard.dart';
import 'package:furniturezoid/screen/login_screen.dart';
import 'package:furniturezoid/screen/map_screen.dart';
import 'package:furniturezoid/screen/register_screen.dart';
import 'package:furniturezoid/screen/splash_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  LoginPageScreen.route: (context) => const LoginPageScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  GoogleMapScreen.route: (context) => const GoogleMapScreen(),
};