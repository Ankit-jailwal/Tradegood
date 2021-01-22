import 'package:flutter/material.dart';
import 'package:tradegood/constants.dart';
import 'package:tradegood/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  String name;
  String phone;
  String email;
  String password;
  Body(this.name,this.phone,this.email,this.password);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +91 $phone"),
              buildTimer(),
              OtpForm(phone),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expire in 2 minutes"),
      ],
    );
  }
}
