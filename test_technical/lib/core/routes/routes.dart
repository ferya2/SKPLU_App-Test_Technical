import 'package:flutter/material.dart';
import 'package:test_technical/feature/auth/view/forgotpassword.dart';
import 'package:test_technical/feature/auth/view/register.dart';
import 'package:test_technical/feature/homepage/view/widget/navbarScreen.dart';
import '../../feature/auth/view/login.dart';
import '../../feature/homepage/view/homepage.dart';

class RoutingPage {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPageRoute(LoginView());
      case '/login':
        return _buildPageRoute(LoginView());
      case '/register':
        return _buildPageRoute(const RegisterPage());
      case '/home':
        return _buildPageRoute(const HomePage());
      case '/navbar':
        return _buildPageRoute(NavbarScreen());
      case '/forgotpassword':
        return _buildPageRoute(const ForgotPasswordView());
      default:
        return _buildPageRoute(const HomePage());
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
            parent: animation, curve: Curves.fastLinearToSlowEaseIn);
        return Align(
          alignment: Alignment.topRight,
          child: ScaleTransition(scale: animation, child: page),
        );
      },
      transitionDuration: const Duration(milliseconds: 700),
    );
  }
}
