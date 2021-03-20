import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';


class serverError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeConfig.screenWidth*0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/serverError.jpg')),
            SizedBox(height: 25,),
            Container(
              height: 25,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:7.0,right: 7.0),
                child: Text("Retry",style: TextStyle(color: Colors.white70),),
              ),
            )
          ],
        ),
      ),
    );
  }
}