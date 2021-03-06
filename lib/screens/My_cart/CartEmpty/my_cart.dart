import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/My_cart/CartEmpty/components/Body.dart';

class cartScreenEmpty extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 33,
            color: Colors.white,
          ),
        ),
        title:Text("My cart",
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          Image.asset(
            "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
            width: 33,
            height: 33,
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartScreenEmpty()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
              child: Image.asset(
                "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: cartEmptyBody(),
    );
  }
}