import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

class noOrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images2/b28fd6cc341eb8dbf1d82dd8e6e03e20d6a5bf92.png",height: SizeConfig.screenHeight*0.5,width:SizeConfig.screenWidth*0.5,),
          SizedBox(height: 20,),
          Text("You have no past orders",
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
