import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

class noItemBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.screenWidth*0.75,
            child: Image.asset(
              "assets/images2/no-results.png"
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.02,),
          Text("No items Found!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roberto",
              fontWeight: FontWeight.w600,
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
                child: Text("Continue Shopping",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
