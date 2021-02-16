import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*0.025,),
            Container(
              width: SizeConfig.screenWidth*0.5,
              child: Image.asset(
                "assets/images2/tgood_black.png"
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            Container(
              width: SizeConfig.screenWidth*0.8,
              child: Text(aboutUs,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Roberto",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10 ,)
          ],
        ),
      ),
    );
  }
}
