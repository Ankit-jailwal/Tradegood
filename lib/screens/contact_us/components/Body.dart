import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight*0.15,),
          Container(
            width: SizeConfig.screenWidth*0.5,
            child: Image.asset(
              "assets/images2/cf740cc8294712eab3a5d601fc40f76bd9a3a5b8.png"
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.01,),
          Text("Contact Info",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roberto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.01,),
          Text("Phone No: +91-12345678",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Roberto",
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.01,),
          Text("Email Address: tradegood@contactus",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Roberto",
            ),
          ),
        ],
      ),
    );
  }
}
