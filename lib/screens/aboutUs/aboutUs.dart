import 'package:flutter/material.dart';
import 'package:tradegood/screens/aboutUs/components/Body.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';

class aboutUs extends StatelessWidget {
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
        title: Text("About Us",
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
      body: Body(),
    );
  }
}
