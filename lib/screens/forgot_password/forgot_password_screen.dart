import 'package:flutter/material.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return !connected?noInternet():Body();
                },
                child: Container()
            );
          },
        )
    );
  }
}
