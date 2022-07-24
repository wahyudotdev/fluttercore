import 'package:flutter/material.dart';
import 'package:{{package_name}}/ui/menu_screen.dart';
import 'splash/screen/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/menu':
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
