import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.055,
                  width: SizeConfig.screenWidth*0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Recent Orders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.055,
                  width: SizeConfig.screenWidth*0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Recent Orders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Container(height: SizeConfig.screenHeight * 0.055, width:0.7,color: Colors.white,)),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.01,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 50, //list view declaration
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5.0,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name Here",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Distributor: ABC Distributor",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.screenWidth * 0.04,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'Delivery by 26 SEP, Monday |',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 12),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' FREE',
                                              style: TextStyle(
                                                  color: Colors.lightGreenAccent,
                                                  fontSize: 12),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: SizeConfig.screenWidth * 0.15,
                                    child: Image.asset(
                                        "assets/images2/6d9832a493c3de8137461d975e7a6e0b00605a06.png")),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.015,)
                    ],
                  );
                }))
      ],
    );
  }
}
