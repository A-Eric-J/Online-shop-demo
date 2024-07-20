import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/ui/widgets/welcome_screen/welcome_box.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Image.asset(background,fit: BoxFit.cover,),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WelcomeBox(),
                ],
              ),
            ],
          ),
        ));
  }
}
