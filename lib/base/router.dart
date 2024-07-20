import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/route_paths.dart';
import 'package:pixelfield_test_app/ui/screens/login_screen.dart';
import 'package:pixelfield_test_app/ui/screens/main_view.dart';

/// All the Routes for navigating are placed here
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPath:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case mainViewPath:
        return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                      'No route defined for ${settings.name}',
                    ),
                  ),
                ));
    }
  }
}
