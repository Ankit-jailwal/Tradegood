import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';


class cartEmptyBody extends StatefulWidget {
  @override
  _cartEmptyBodyState createState() => _cartEmptyBodyState();
}

class _cartEmptyBodyState extends State<cartEmptyBody> {
  double cartSum=0;
  bool check(int index, int size) {
    if (index == size - 1)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.screenWidth*0.75,
            child: Image.asset(
                "assets/images2/f6d6236f772c42f3d2ae5710ea233686e50dfc37.png"
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.02,),
          Text("No items in your Cart",
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
          FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
