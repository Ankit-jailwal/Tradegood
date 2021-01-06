import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.screenWidth*0.75,
            child: Image.asset(
              "assets/images2/3941db032c0f92bdb20b1926d72fdb079ee7ae54.png"
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.02,),
          Text("No items in your Wishlist",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roberto",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("Let's get you started",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roberto",
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.04,),
          Container(
            height: SizeConfig.screenHeight*0.06,
            width: SizeConfig.screenWidth*0.4,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("Start Shopping",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Roberto",
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
