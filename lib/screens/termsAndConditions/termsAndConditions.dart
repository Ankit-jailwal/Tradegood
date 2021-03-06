import 'package:flutter/material.dart';
import 'package:tradegood/screens/termsAndConditions/components/Body.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';

class termsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 33,
            color: Colors.white,
          ),
        ),
        title: Text("Terms And Conditions",
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          Image.asset("assets/images2/f12e59ae8e5ecc4e4fa1ed606e384e238ff3c013.png",
            width: 33,
            height: 33,
          ),
          SizedBox(width: SizeConfig.screenWidth*0.02,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cart_screen()));
            },
            child: Padding(
              padding: EdgeInsets.only(right:SizeConfig.screenWidth*0.02),
              child: Image.asset("assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
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
