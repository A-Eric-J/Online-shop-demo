import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';
import 'package:pixelfield_test_app/ui/screens/splash_screen.dart';
import 'package:pixelfield_test_app/base/router.dart' as router;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: brandMainColor),
        onGenerateRoute: router.Router.generateRoute,
        debugShowCheckedModeBanner: true,
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: const SplashScreen(),
    );
  }
}
