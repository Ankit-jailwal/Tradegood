import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
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
