import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/const_values/route_paths.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/models/debouncer.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// This means that the [SplashScreen] waits for 8 milliseconds
  static final DeBouncer splashDeBouncer = DeBouncer(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() {
    splashDeBouncer.run(() {

      //TODO checking that we are loggedIn to visit MainView or visit loginScreen
      locator<NavigationService>().navigateTo(
        welcomePath,
        pushReplacement: true,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Image.asset(background,fit: BoxFit.cover,),
              ),
              Image.asset(logo)
            ],
          ),
        ));
  }
}
