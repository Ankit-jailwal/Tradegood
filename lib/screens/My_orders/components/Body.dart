import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/getOrder.dart';
import 'package:toast/toast.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool passFlag=false;
  void update(bool flagUpdate) {
    setState(() => passFlag=flagUpdate);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getOrder(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                orderNavigation(update),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data['orders'].length,
                        //list view declaration
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemBuilder: (BuildContext context, int index) {
                          return orderItem(snapshot.data, index, this.passFlag);
                        }))
              ],
            );
          }
          return Center(child: Container(child: CircularProgressIndicator()));
        }
    );
  }
}

class orderItem extends StatefulWidget {
  var data;
  int index;
  bool passFlag;
  orderItem(this.data,this.index,this.passFlag);
  @override
  _orderItemState createState() => _orderItemState();
}

class _orderItemState extends State<orderItem> {
  String type="";
  bool flag=false;
bool check=false;
int prevCount=0;
int reCount=0;
  checkStatus(var data)
  {
    print(data);
    if(widget.passFlag==true){
      if (data[4]['isCompleted'] == true) {
        flag = true;
        type = data[4]['type'];
      }
      else
        flag = false;

    }
    else  //Previous orders
      {
      if (data[4]['isCompleted'] == true) {
        flag = false;
        type = data[4]['type'];
      }
      else {
        for (int i = 0; i < data.length - 1; i++) {
          if (data[i]['isCompleted'] == true) {
            flag = true;
            print(data.length);
            type = data[i]['type'];
          }
        }
      }
      }
    print("PRev $prevCount");
  }


  @override
  Widget build(BuildContext context) {
    checkStatus(widget.data["orders"][widget.index]["orderStatus"]);
    return flag?Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                crossAxisAlignment: CrossAxisAlignment
                    .start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth *
                            0.65,
                        child: Text(
                          widget.data['orders'][widget.index]['orderItems'][0]['product']['name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Order status: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: type,
                                style: TextStyle(
                                    color: Colors
                                        .lightGreenAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight
                                        .w700
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Delivery by 26 SEP, Monday |',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' FREE',
                                style: TextStyle(
                                    color: Colors
                                        .lightGreenAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight
                                        .w700
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                  Container(
                      width: SizeConfig.screenWidth * 0.15,
                      child: Image.network(
                          widget.data['orders'][widget.index]['orderItems'][0]['product']['productPicture'])),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.015,)
      ],
    ):Container();
  }
}

class orderNavigation extends StatefulWidget {
  final ValueChanged<bool> update;
  orderNavigation(this.update);
  @override
  _orderNavigationState createState() => _orderNavigationState();
}

class _orderNavigationState extends State<orderNavigation> {
  bool orderNavigationFlag=true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: (){
              setState(() {
                if(orderNavigationFlag!=false)
                  {
                    Toast.show("Already in Recent Orders", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  }
                else
                  {
                    widget.update(false);
                    orderNavigationFlag=true;
                  }
              });
          },
          child: Container(
            height:orderNavigationFlag?SizeConfig.screenHeight * 0.06:SizeConfig.screenHeight * 0.058,
            width: SizeConfig.screenWidth*0.5,
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              border: orderNavigationFlag?null:Border.all(),
              boxShadow: [
                orderNavigationFlag?BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: Offset(0, 3),
                ):BoxShadow(),
              ],
            ),
            child: Center(
              child: Text(
                "Recent Orders",
                style: TextStyle(
                  color: orderNavigationFlag?Colors.black:Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              if(orderNavigationFlag!=true)
              {
                Toast.show("Already in Previous Orders", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              }
              else
              {
                widget.update(true);
                orderNavigationFlag=false;
              }
            });
          },
          child: Container(
            height:!orderNavigationFlag?SizeConfig.screenHeight * 0.06:SizeConfig.screenHeight * 0.058,
            width: SizeConfig.screenWidth*0.5,
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              border: !orderNavigationFlag?null:Border.all(),
              boxShadow: [
                !orderNavigationFlag?BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: Offset(0, 3),
                ):BoxShadow(),
              ],
            ),
            child: Center(
              child: Text(
                "Previous Orders",
                style: TextStyle(
                  color: !orderNavigationFlag?Colors.black:Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
