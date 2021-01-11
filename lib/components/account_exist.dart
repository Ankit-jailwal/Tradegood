import 'package:flutter/material.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import '../constants.dart';
import '../size_config.dart';

class haveAccountText extends StatelessWidget {
  const haveAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            //Navigator.pushNamed(context, SignInScreen.routeName);
            },
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
