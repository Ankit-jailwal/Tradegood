import 'package:flutter/material.dart';
import 'package:tradegood/routes.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:tradegood/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TradeGood',
      theme: theme(),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
