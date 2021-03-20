import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';
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
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return !connected?noInternet():Body(name,phone,email,password);
                },
                child: Container()
            );
          },
        )
    );
  }
}
