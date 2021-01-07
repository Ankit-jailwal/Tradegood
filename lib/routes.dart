import 'package:flutter/widgets.dart';
import 'package:tradegood/screens/forgot_password/forgot_password_screen.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};

