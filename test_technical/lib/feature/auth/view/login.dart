import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_technical/core/resources/colors.dart';
import 'package:test_technical/core/resources/padding.dart';
import 'package:test_technical/core/resources/texstyle.dart';
import 'package:test_technical/core/routes/routes.dart';
import 'package:test_technical/feature/auth/widget/button_custom.dart';
import 'package:test_technical/feature/auth/widget/textField_noObsecure.dart';
import 'package:test_technical/feature/auth/widget/textfield_obsecure.dart';
import 'package:provider/provider.dart';

import '../viewmodels/viewmodel_login.dart'; // Import provider

class LoginView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

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
                  child: Lottie.asset('assets/animations/loginLottie.json',
                      height: 340)),
              // text
              Text('Login', style: AppTextStyle.title),
              Text('Please login to continue.', style: AppTextStyle.subtitle),
              const SizedBox(height: 40),
              // textfield username
              TextFieldCustom(
                controller: usernameController,
                icon: Icons.person_outline,
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
              const SizedBox(height: 20),
              // textfield password
              TextFieldPassword(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      RoutingPage.onGenerateRoute(
                          RouteSettings(name: '/forgotpassword')),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyle.smallText,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Button login
              Consumer<LoginViewModel>(
                builder: (context, model, child) {
                  return ButtonCustom(
                    label: model.isLoading ? 'Loading...' : 'Login',
                    onPressed: model.isLoading
                        ? null
                        : () {
                            // Bungkus operasi async dalam fungsi sinkron
                            _loginDummy(model, context);
                          } as VoidCallback?, // Casting as VoidCallback agar bisa dianggap sebagai VoidCallback
                  );
                },
              ),

              // jika tidak ada akun
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
                                  RouteSettings(name: '/register')));
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

  // Separate login function for async operations
  void _loginDummy(LoginViewModel model, BuildContext context) async {
    bool isSuccess = await model.loginDummyJson(
      usernameController.text,
      passwordController.text,
    );

    // Ensure the widget is still mounted
    if (context.mounted) {
      if (isSuccess) {
        // Show success snack bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );

        // Navigate to home page
        Navigator.pushReplacement(context,
            RoutingPage.onGenerateRoute(RouteSettings(name: '/navbar')));
      } else {
        // Show failure snack bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    }
  }
}
