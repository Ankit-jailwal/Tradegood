import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/screens/Location_list/components/Body.dart';

class location_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
        title: Text("Choose your Route",
        style: TextStyle(
          color: Colors.white,
        ),),
        actions: [
          Image.asset("assets/images2/f12e59ae8e5ecc4e4fa1ed606e384e238ff3c013.png",
            width: 33,
            height: 33,
          ),
          SizedBox(width: SizeConfig.screenWidth*0.02,),
          Padding(
            padding: EdgeInsets.only(right:SizeConfig.screenWidth*0.02),
            child: Image.asset("assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
              width: 33,
              height: 33,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Body(),
    );
  }
}