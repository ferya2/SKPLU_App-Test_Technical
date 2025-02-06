import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_technical/core/resources/colors.dart';
import 'package:test_technical/core/resources/padding.dart';
import 'package:test_technical/feature/auth/widget/button_custom.dart';
import 'package:test_technical/feature/auth/widget/textField_noObsecure.dart';
import 'package:test_technical/feature/auth/widget/textfield_obsecure.dart';

import '../../../core/resources/texstyle.dart';
import '../../../core/routes/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteNeutral,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: CustomPadding.kSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // animasi lottie
              Center(
                child: Lottie.asset('assets/animations/registerLottie.json',
                    height: 240),
              ),
              // text
              Text('Register', style: AppTextStyle.title),
              Text('Please Register to login.', style: AppTextStyle.subtitle),
              const SizedBox(height: 40),
              // textfield username
              TextFieldCustom(
                labelText: 'Username',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 10),
              // textfield Phone number
              TextFieldCustom(
                labelText: 'Phone Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                hintText: 'Enter your phone number',
              ),
              const SizedBox(height: 10),
              // textfield password
              TextFieldPassword(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 20),
              // Button Register
              ButtonCustom(
                  label: 'Register',
                  onPressed: () {},
                  textStyle: AppTextStyle.smallTextWhiteColor),
              // jika sudah punya akun
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: AppTextStyle.smallTextGreyColor,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              RoutingPage.onGenerateRoute(
                                  RouteSettings(name: '/login')));
                        },
                        child: Text(
                          'Register',
                          style: AppTextStyle.smallText,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
