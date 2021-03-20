import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';


class noInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeConfig.screenWidth*0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/noInternet.jpg')),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Reconnecting... ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight:FontWeight.w700),),
                SizedBox(height: 20, width: 20,child: CircularProgressIndicator(strokeWidth: 2,))
              ],
            )
          ],
        ),
      ),
    );
  }
}


