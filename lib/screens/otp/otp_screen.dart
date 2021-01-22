import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  String name;
  String phone;
  String email;
  String password;
  OtpScreen(this.name,this.phone,this.email,this.password);
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(name,phone,email,password),
    );
  }
}
