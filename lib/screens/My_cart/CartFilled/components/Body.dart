import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/getCart.dart';
import 'package:tradegood/API/getProductById.dart';
import 'package:tradegood/API/removeItemCart.dart';
import 'package:tradegood/API/placeOrder.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool check(int index, int size) {
    if (index == size - 1)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCart(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Column(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.075,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Deliver to ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Shivani",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  )
                                ]),
                          ),
                          Text(
                            "xyz address of the retailer's shop",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.045,
                        width: SizeConfig.screenWidth * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data['cart']['cartItems'].length, //list view declaration
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder(
                          future: getProductByID(snapshot.data['cart']['cartItems'][index]['product']),
                          builder: (context, cartItem) {
                            if(cartItem.hasData) {
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
                                            top: 10,
                                            bottom: 10,
                                            left: 15,
                                            right: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:SizeConfig.screenWidth * 0.7,
                                                      child: Text(
                                                        cartItem.data['product'][0]['name'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                      SizeConfig.screenHeight *
                                                          0.025,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₹${cartItem.data['product'][0]['ptr'].toString()}",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .w600),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          height: SizeConfig
                                                              .screenHeight *
                                                              0.045,
                                                          width:
                                                          SizeConfig
                                                              .screenWidth *
                                                              0.18,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Text(
                                                                "Qty: ${snapshot.data['cart']['cartItems'][index]['quantity']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                              ),
                                                              Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .black,
                                                                size: 12,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    width: SizeConfig
                                                        .screenWidth *
                                                        0.15,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                          cartItem.data['product'][0]['productPicture'],fit: BoxFit.fill,),
                                                    )),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                        'Delivery by 26 SEP, Monday |',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' FREE',
                                                            style: TextStyle(
                                                                color:
                                                                Colors
                                                                    .lightGreenAccent
                                                                    .shade700,
                                                                fontSize: 14),
                                                          )
                                                        ]),
                                                  ),
                                                  FlatButton(
                                                    onPressed: (){
                                                      setState(() {
                                                        removeItemCart(cartItem.data['product'][0]['_id']);
                                                      });
                                                    },
                                                    child: Container(
                                                      height: SizeConfig
                                                          .screenHeight *
                                                          0.045,
                                                      width: SizeConfig
                                                          .screenWidth *
                                                          0.18,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border:
                                                        Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            color: Colors.black54,
                                                            size: 12,
                                                          ),
                                                          Text(
                                                            "Remove",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.015,
                                  ),
                                  check(index,
                                      snapshot.data['cart']['cartItems'].length)
                                      ? Column(
                                    children: [
                                      Divider(
                                        color: Colors.grey, thickness: 0.5,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Price Details", style: TextStyle(
                                                color: Colors.black.withOpacity(
                                                    0.7),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 0.5,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("Price(${snapshot.data['cart']['cartItems'].length} item)",
                                                  style: TextStyle(
                                                      color: Colors.black),),
                                                Text(
                                                    "138", style: TextStyle(
                                                    color: Colors.black)),
                                              ],
                                            ),
                                            /*Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "Discount", style: TextStyle(
                                                    color: Colors.black),),
                                                Text("-₹1000", style: TextStyle(
                                                    color: Colors
                                                        .lightGreenAccent
                                                        .shade700)),
                                              ],
                                            ),*/
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey.withOpacity(0.6),
                                        thickness: 0.5,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text("Total amount",
                                              style: TextStyle(
                                                  color: Colors.black),),
                                            Text("₹10,500", style: TextStyle(
                                                color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey, thickness: 0.5,),
                                    ],
                                  )
                                      : Container()
                                ],
                              );
                            }
                            return Container();
                          }
                        );
                      })),
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 5,
                      offset: Offset(0, -3))
                ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10, right: 10, bottom: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹10,500",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FlatButton(
                        onPressed: (){

                        },
                        child: Container(
                          height: SizeConfig.screenHeight * 0.045,
                          width: SizeConfig.screenWidth * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              "Place order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }
        return Center(
          child: Container(
          child:CircularProgressIndicator()
          ),
        );
      }
    );
  }
}
