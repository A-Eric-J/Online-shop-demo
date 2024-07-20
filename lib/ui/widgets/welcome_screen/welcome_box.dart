import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/const_values/route_paths.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';

class WelcomeBox extends StatelessWidget {
  const WelcomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: welcomeBoxBackgroundColor,
      margin: const EdgeInsets.only(bottom: 32, right: 16, left: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(
                fontFamily: 'EBGaramond',
                fontSize: 32,
                color: whiteTextColor_1,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Text text text',
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 16,
                color: whiteTextColor_1,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 1500),
                    content: Text(
                      'Scan bottle!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 16,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: orangeColor_1,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                minimumSize: Size(width, 56),
              ),
              child: const Text(
                'Scan bottle',
                style: TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 16,
                    color: darkColor,
                    fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 24,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Have an account?',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: whiteTextColor_2,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 24,),
              InkWell(
                splashColor: transparent,
                highlightColor: transparent,
                onTap: ()=> locator<NavigationService>().navigateTo(
                  signInPath,
                ),
                child: const Text(
                  'Sign in first',
                  style: TextStyle(
                      fontFamily: 'EBGaramond',
                      fontSize: 16,
                      color: orangeColor_2,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
