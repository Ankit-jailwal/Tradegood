import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images2/b28fd6cc341eb8dbf1d82dd8e6e03e20d6a5bf92.png",height: SizeConfig.screenHeight*0.5,),
          SizedBox(height: 20,),
          Text("You have no past orders",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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
