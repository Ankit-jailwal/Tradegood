import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';
import 'package:flutter/cupertino.dart';
import 'package:tradegood/API/getProductById.dart';
import 'package:tradegood/API/removeItemCart.dart';
import 'package:tradegood/API/placeOrder.dart';
import 'package:tradegood/screens/My_cart/CartEmpty/components/Body.dart';
import 'package:tradegood/API/getCart.dart';
import 'package:tradegood/API/getUserInfo.dart';
import 'package:tradegood/screens/Location_list/location_list.dart';
import 'package:tradegood/API/getRouteById.dart';
import 'package:intl/intl.dart';
import 'package:tradegood/API/calculateCartSum.dart';


class cart_screen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _cart_screenState createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  bool flag;
  bool checkCart(var data){
    if(data.length==0)
    {
      flag= false;
    }
    else if(data['cart']['cartItems'].length!=0)
    {
      flag= true;
    }
    else
      flag=false;
    return flag;
  }
  void update(bool flagUpdate) {
    setState(() => flag=flagUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 33,
            color: Colors.white,
          ),
        ),
        title:Text("My cart",
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishListScreen()));
            },
            child: Image.asset(
              "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
              width: 33,
              height: 33,
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cart_screen()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
              child: Image.asset(
                "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getCart(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return checkCart(snapshot.data)?FutureBuilder(
              future: getUserInfo(),
              builder: (context, userInfo) {
                if(userInfo.hasData) {
                  return FutureBuilder(
                      future: calculateCartSum(snapshot.data),
                      builder: (context, cartSum)  {
                        if(snapshot.hasData) {
                          return Column(
                            children: [
                              Container(
                                height: SizeConfig.screenHeight * 0.075,
                                decoration: BoxDecoration(color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 5,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: 'Deliver to ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: userInfo.data['user']['name'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight
                                                            .w800),
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    location_list()),
                                          );
                                        },
                                        child: Container(
                                          height: SizeConfig.screenHeight *
                                              0.045,
                                          width: SizeConfig.screenWidth * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black54),
                                            borderRadius: BorderRadius.circular(
                                                5),
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
                                      itemCount: snapshot
                                          .data['cart']['cartItems']
                                          .length, //list view declaration
                                      padding: EdgeInsets.only(
                                          top: 10.0, bottom: 15.0),
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return FutureBuilder(
                                            future: getProductByID(snapshot.data['cart']['cartItems'][index]['product']),
                                            builder: (context, cartItem) {
                                              if (cartItem.hasData) {
                                                return cartItemClass(cartItem.data,snapshot.data,cartSum.data,index,update);
                                              }
                                              return Container();
                                            }
                                        );
                                      })),
                              Container(
                                decoration: BoxDecoration(color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          blurRadius: 5,
                                          offset: Offset(0, -3))
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 15, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        "₹${cartSum.data}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          placeOrderItem(
                                              snapshot.data['cart']['cartItems']);
                                        },
                                        child: Container(
                                          height: SizeConfig.screenHeight *
                                              0.045,
                                          width: SizeConfig.screenWidth * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrangeAccent,
                                            borderRadius: BorderRadius.circular(
                                                3),
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
                        return Center(child: Container(child: CircularProgressIndicator()));
                    }
                  );
                }
                return Center(child: Container(child: CircularProgressIndicator()));
              }
            ):cartEmptyBody();
          }
          return Center(child: Container(child: CircularProgressIndicator()));
        }
      ),
    );
  }
}


class cartItemClass extends StatefulWidget {
  var cartItemData;
  var cartData;
  var cartSumData;
  final ValueChanged<bool> update;
  int index;
  cartItemClass(this.cartItemData,this.cartData,this.cartSumData,this.index,this.update);
  @override
  _cartItemClassState createState() => _cartItemClassState();
}

class _cartItemClassState extends State<cartItemClass> {
  bool check(int index, int size){
    if (index == size - 1)
      return true;
    else
      return false;
  }
  bool removeItemFlag=true;
  @override
  Widget build(BuildContext context) {
    return removeItemFlag?Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 5, right: 5),
          child: Container(
            width: SizeConfig
                .screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(
                      0.5),
                  blurRadius: 5.0,
                  offset: Offset(
                      0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets
                  .only(
                  top: 10,
                  bottom: 10,
                  left: 15,
                  right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Container(
                            width: SizeConfig
                                .screenWidth *
                                0.7,
                            child: Text(
                              widget.cartItemData['product'][0]['name'],
                              style: TextStyle(
                                  color: Colors
                                      .black,
                                  fontSize: 16,
                                  fontWeight: FontWeight
                                      .w600),
                            ),
                          ),
                          SizedBox(
                            height:
                            SizeConfig
                                .screenHeight *
                                0.025,
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${(widget.cartItemData['product'][0]['ptr']*(widget.cartData['cart']['cartItems'][widget.index]['quantity']/widget.cartItemData['product'][0]['quantity']))
                                    .toString()}",
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
                                  color: Colors
                                      .white,
                                  border: Border
                                      .all(
                                      color: Colors
                                          .grey),
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      3),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      "Qty: ${widget.cartData['cart']['cartItems'][widget.index]['quantity']}",
                                      style: TextStyle(
                                          color: Colors
                                              .black54,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                    ),
                                    Icon(
                                      Icons
                                          .edit,
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
                            borderRadius: BorderRadius
                                .circular(
                                5),
                            child: Image
                                .network(
                              widget.cartItemData['product'][0]['productPicture'],
                              fit: BoxFit.fill,),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets
                        .only(
                        top: 20),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        FutureBuilder(
                            future: getRouteById(),
                            builder: (
                                context,
                                snapshot) {
                              if (snapshot
                                  .hasData) {
                                return RichText(
                                  text: TextSpan(
                                      text:
                                      'Delivery by ${DateFormat('d MMM, yy')
                                          .format(
                                        DateTime
                                            .parse(
                                            snapshot
                                                .data['route']['deliveryDate']),)} |',
                                      style: TextStyle(
                                          color: Colors
                                              .black,
                                          fontSize: 14),
                                      children: <
                                          TextSpan>[
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
                                );
                              }
                              return Container();
                            }
                        ),
                        GestureDetector(
                          onTap: () async{
                            setState(() {
                              removeItemFlag=false;
                            });
                            await removeItemCart(widget.cartItemData['product'][0]['_id']);
                            setState(() {
                              widget.update(false);
                            });
                          },
                          child: Container(
                            height: SizeConfig.screenHeight * 0.045,
                            width: SizeConfig.screenWidth * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(
                                  color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.black54,
                                  size: 14  ,
                                ),
                                Text(
                                  "Remove",
                                  style: TextStyle(
                                      color: Colors
                                          .black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight
                                          .w800),
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
          height: SizeConfig
              .screenHeight *
              0.015,
        ),
        check(widget.index, widget.cartData['cart']['cartItems'].length)
            ? Column(
          children: [
            Divider(
              color: Colors.grey,
              thickness: 0.5,),
            Padding(
              padding: const EdgeInsets
                  .only(
                  left: 10,
                  right: 5),
              child: Row(
                children: [
                  Text(
                    "Price Details",
                    style: TextStyle(
                        color: Colors
                            .black
                            .withOpacity(
                            0.7),
                        fontSize: 16,
                        fontWeight: FontWeight
                            .w800),),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,),
            Padding(
              padding: const EdgeInsets
                  .only(
                  right: 5,
                  left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Text(
                        "Price(${widget.cartData['cart']['cartItems'].length} item)",
                        style: TextStyle(
                            color: Colors
                                .black),),
                      Text(
                          "₹${widget.cartSumData}",
                          style: TextStyle(
                              color: Colors
                                  .black)),
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
              color: Colors.grey
                  .withOpacity(
                  0.6),
              thickness: 0.5,),
            Padding(
              padding: const EdgeInsets
                  .only(
                  left: 10,
                  right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    "Total amount",
                    style: TextStyle(
                        color: Colors
                            .black),),
                  Text("₹${widget.cartSumData}",
                      style: TextStyle(
                          color: Colors
                              .black)),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,),
          ],
        )
            : Container()
      ],
    ):Container();
  }
}
