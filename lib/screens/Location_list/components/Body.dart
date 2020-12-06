import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: SizeConfig.screenHeight * 0.17,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueAccent.withOpacity(0.2),
              ),
              child: Padding(
                padding: EdgeInsets.all(9),
                child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Monday',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roberto",
                                color: Colors.black,
                                fontWeight: FontWeight.w800
                            ),
                          )),
                      Align(
                      alignment: Alignment.topRight,
                        child: Text('Next Delivery: 25 Sep,20',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Roberto",
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                          ),
                        )),
                  ]
                  ),
                    SizedBox(height: SizeConfig.screenHeight*0.01,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Route:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.5,
                        ),
                        ),
                        Expanded(
                          child: Text(" Location 1, Location 2, Location 3, Location 4, Location 5, Location 6, Location 7",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight*0.01,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        width: SizeConfig.screenWidth*0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Select",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    )
                ]
                ),
              ),
            ),
          );
        });
  }
}
