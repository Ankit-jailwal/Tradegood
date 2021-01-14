import 'package:flutter/material.dart';
import 'package:tradegood/screens/sign_up/sign_up_screen.dart';
import 'package:tradegood/screens/forgot_password/forgot_password_screen.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: Colors.red),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
            );
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue),
          ),
        ),
      ],
    );
  }
}
