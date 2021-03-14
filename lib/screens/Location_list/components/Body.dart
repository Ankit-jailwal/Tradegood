import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/getRoutes.dart';
import 'package:tradegood/API/selectRoute.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String deliveryDay="";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:getRoutes(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {

                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data['routing'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return routeSelect(snapshot.data, index);
                    });
              }
              return Center(child: Container(child: CircularProgressIndicator()));
            }
          );
        }
}
//
class routeSelect extends StatefulWidget {
  var data;
  int index;
  routeSelect(this.data,this.index);
  @override
  _routeSelectState createState() => _routeSelectState();
}

class _routeSelectState extends State<routeSelect>{
  bool locCheck=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueAccent.withOpacity(0.2),
        ),
        child: Padding(
          padding: EdgeInsets.all(9),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(widget.data['routing'][widget.index]['day'],
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roberto",
                                color: Colors.black,
                                fontWeight: FontWeight.w800
                            ),
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text('Next Delivery: ${DateFormat('d MMM, yy').format(DateTime.parse(widget.data['routing'][widget.index]['deliveryDate']),)}',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Roberto",
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            ),
                          )),
                    ]
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Route: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.5,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.data['routing'][widget.index]['location'].join(', '),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.5,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: SizeConfig.screenHeight*0.01,),
                GestureDetector(
                  onTap: () async{
                      if (locCheck == true) {
                        setState(() {
                        });
                      }
                      else {
                        selectRoute(widget.data['routing'][widget.index]['_id']);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("SUCCESS",style: TextStyle(fontWeight: FontWeight.w800),),
                              content: Text("Delivery date set to ${DateFormat('d MMM, yy').format(DateTime.parse(widget.data['routing'][widget.index]['deliveryDate']),)}",style: TextStyle(fontWeight: FontWeight.w600),),
                              actions: [
                            FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            )
                              ],
                            );
                          },
                        );
                      }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        widget.data['routing'][widget.index]['deliveryCharge']==0?Row(
                          children: [
                            Text("Delivery Charge: ",style: TextStyle(color: Colors.black),),
                            Text("FREE",style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.w600),),
                          ],
                        ):Text("Delivery Charge: ₹${widget.data['routing'][widget.index]['deliveryCharge']}",style: TextStyle(color: Colors.black),),
                        Row(
                          children: [
                            locCheck ? Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Image.asset(
                                "assets/images2/9cc73194de6fa0e85d13ba8fe84e31a844ad6341.png",
                                height: 25,),
                            ) : Container(),
                            Container(
                              height: 30,
                              width: locCheck ? SizeConfig.screenWidth *
                                  0.25 : SizeConfig.screenWidth * 0.2,
                              decoration: BoxDecoration(
                                color:Colors
                                    .blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
//