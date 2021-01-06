import 'package:flutter/widgets.dart';
//import 'package:tradegood/screens/complete_profile/complete_profile_screen.dart';
import 'package:tradegood/screens/details/details_screen.dart';
import 'package:tradegood/screens/forgot_password/forgot_password_screen.dart';
import 'package:tradegood/screens/home/home_screen.dart';
import 'package:tradegood/screens/otp/otp_screen.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';


import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
 // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen("Categories","/category/getCategory",false),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};

