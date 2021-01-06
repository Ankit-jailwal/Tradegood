import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
        children: [
          Image.asset("assets/images2/f6d6236f772c42f3d2ae5710ea233686e50dfc37.png",height: SizeConfig.screenHeight*0.5,),
          SizedBox(height: 20,),
          Text("No items in your cart",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          Text("Let's get you started",style: TextStyle(fontSize: 10),),
          SizedBox(height: 15,),
          Container(height: 35,width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: Center(child: Text("Start Shopping",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
