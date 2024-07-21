import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/const_values/route_paths.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/services/auth_service.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var obscurePassword = true;
  var isEmailNotEmpty = false;
  var isPasswordNotEmpty = false;
  final AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: screensBackgroundColor,
      body: SafeArea(
        /// Maybe the user's phone is too small and
        /// we may have overflow in this page so SingleChildScrollView added.
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => locator<NavigationService>().goBack(),
                  splashColor: transparent,
                  highlightColor: transparent,
                  child: const Icon(
                    Icons.arrow_back,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Sign in',
                  style: TextStyle(
                      fontFamily: 'EBGaramond',
                      fontSize: 32,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () => node.nextFocus(),
                  textInputAction: TextInputAction.next,
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        isEmailNotEmpty = false;
                      });
                    }
                    else{
                      setState(() {
                        isEmailNotEmpty = true;
                      });
                    }
                  },
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor_1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor_1),
                    ),
                    label: Text(
                      'Email',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: orangeColor_1,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  cursorColor: whiteTextColor_1,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: obscurePassword,
                  onEditingComplete: () => node.unfocus(),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        isPasswordNotEmpty = false;
                      });
                    }
                    else{
                      setState(() {
                        isPasswordNotEmpty = true;
                      });
                    }
                  },
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor_1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: orangeColor_1),
                    ),
                    label: const Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: orangeColor_1,
                          fontWeight: FontWeight.w400),
                    ),
                    suffix: InkWell(
                        splashColor: transparent,
                        highlightColor: transparent,
                        onTap: () => setState(() {
                              obscurePassword = !obscurePassword;
                            }),
                        child: obscurePassword
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: orangeColor_1,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: orangeColor_1,
                              )),
                  ),
                  cursorColor: whiteTextColor_1,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed:  isEmailNotEmpty && isPasswordNotEmpty ? () async{
                      await _authService.setLoginState(true);
                      locator<NavigationService>()
                        .navigateTo(mainViewPath, pushReplacement: true); }: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor_1,
                      disabledBackgroundColor: grey,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      minimumSize: Size(width, 56),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 16,
                          color: darkColor,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Can’t sign in?',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: whiteTextColor_2,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Recover password',
                      style: TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 16,
                          color: orangeColor_2,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
