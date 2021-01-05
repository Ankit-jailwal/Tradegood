import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:shop_app/API/getProduct.dart';
import 'package:shop_app/screens/order_list_screen/order_screen.dart';
import 'package:shop_app/API/addToCart.dart';
import 'package:shop_app/API/addToWishlist.dart';

class Body extends StatefulWidget {
  String category;
  var catData;
  Body(this.category, this.catData);
  @override
  _BodyState createState() => _BodyState(category, catData);
}

class _BodyState extends State<Body> {
  String category;
  var catData;
  _BodyState(this.category, this.catData);
  int _counter = 0;
  int value = 0;
  bool wishCheck = true;
  bool addCheck = false;
  bool _countFlag = false;

  void _increment() {
    if (_counter >= 0)
      setState(() {
        _counter++;
        _countFlag = true;
      });
    else
      setState(() {
        _countFlag = false;
      });
  }

  void _decrement() {
    if (_counter > 1)
      setState(() {
        _counter--;
      });
    else
      setState(() {
        _counter = 0;
        _countFlag = false;
      });
  }

  Discount(int price) {
    double price1;
    price1 = price * 0.9;
    return price1.truncate();
  }

  @override
  Widget build(BuildContext context) {
    final Color background = Colors.deepOrange.withOpacity(0.8);
    final Color fill = Colors.orangeAccent;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];

    final double fillPercent = 58.23; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return FutureBuilder(
        future: getProduct(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Container(
                  height: 25,
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Center(
                    child: Text(
                      "Free delivery for more than ₹5000 order",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.3)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catData['categoryList'].length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        print("pressed item$index");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => order_screen(
                                  catData['categoryList'][index]['name'],
                                  catData)),
                        );
                      },
                      child: Container(
                        child: Center(
                            child: Padding(
                                padding: EdgeInsets.only(left: 8, right: 15),
                                child: Text(
                                  catData['categoryList'][index]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roberto"),
                                ))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: snapshot
                            .data['products'].length, //list view declaration
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 7.0,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15, left: 25),
                                                child: Container(
                                                  height:
                                                      SizeConfig.screenHeight *
                                                          0.22,
                                                  width:
                                                      SizeConfig.screenHeight *
                                                          0.22,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: Image.network(
                                                      snapshot.data['products']
                                                              [index]
                                                          ['productPicture'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10, bottom: 10),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            snapshot.data[
                                                                    'products']
                                                                [index]['name'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    "Roberto",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .screenWidth *
                                                              0.04,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Column(children: [
                                                              Text(
                                                                "M.R.P",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Roberto",
                                                                ),
                                                              ),
                                                              Text(
                                                                snapshot.data[
                                                                        'products']
                                                                        [index]
                                                                        ['mrp']
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Roberto",
                                                                ),
                                                              ),
                                                            ]),
                                                            SizedBox(
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.04,
                                                            ),
                                                            Column(children: [
                                                              Text(
                                                                "P.T.R",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Roberto",
                                                                ),
                                                              ),
                                                              Text(
                                                                snapshot.data[
                                                                        'products']
                                                                        [index]
                                                                        ['ptr']
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Roberto",
                                                                ),
                                                              ),
                                                            ]),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          "Quantity: 10 kg",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roberto",
                                                          ),
                                                        ),
                                                      ]),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (wishCheck ==
                                                                true) {
                                                              addToWishlist(
                                                                  snapshot
                                                                      .data['products'][index]['_id']);
                                                              wishCheck = false;
                                                            }
                                                            else {
                                                              wishCheck = true;
                                                            }
                                                          });
                                                        },
                                                        child: wishCheck
                                                            ? Image.asset(
                                                                "assets/images2/f99614dc8ffdca073f67f7261c6a80fbbe774e29.png",
                                                                height: 25,
                                                              )
                                                            : Image.asset(
                                                                "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
                                                                height: 25,
                                                              ),
                                                      )
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '% ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.black)),
                                                TextSpan(
                                                    text:
                                                        ' Current Schemes offered by the distributor',
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                              ],
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            size: 14,
                                                            color: Colors
                                                                .lightGreen,
                                                          ),
                                                          SizedBox(
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.008,
                                                          ),
                                                          Text(
                                                            "Available Stock",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Roberto",
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.02),
                                                          Text(
                                                            snapshot.data[
                                                                    'products']
                                                                    [index][
                                                                    'availableStock']
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  "Roberto",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            "Rating:",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Roberto",
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: SizeConfig
                                                                .screenHeight *
                                                            0.06,
                                                        width: SizeConfig
                                                                .screenWidth *
                                                            0.25,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .orangeAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              7),
                                                                  child: Text(
                                                                    _countFlag
                                                                        ? "${_counter}"
                                                                        : "ADD",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontFamily:
                                                                          "Roberto",
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    GestureDetector(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        onTap:
                                                                            () {
                                                                          if (_counter >=
                                                                              0)
                                                                            setState(() {
                                                                              _counter++;
                                                                              _countFlag = true;
                                                                            });
                                                                          else
                                                                            setState(() {
                                                                              _countFlag = false;
                                                                            });
                                                                        }),
                                                                    GestureDetector(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      onTap:
                                                                          _decrement,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  if (addCheck == true) {
                                                                    addCheck =
                                                                    false;
                                                                    addToCart(snapshot.data[
                                                                    'products']
                                                                    [index]['_id'],snapshot.data[
                                                                    'products']
                                                                    [index]['quantity'],snapshot.data[
                                                                    'products']
                                                                    [index]['ptr']);
                                                                    print("SUCCESS");
                                                                  }
                                                                  else
                                                                    addCheck =
                                                                        true;
                                                                });
                                                              },
                                                              child: Container(
                                                                height: 20,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      addCheck
                                                          ? Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/images2/9cc73194de6fa0e85d13ba8fe84e31a844ad6341.png",
                                                                    height: 12,
                                                                  ),
                                                                  SizedBox(width: 4,),
                                                                  Text(
                                                                    "Added",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          "Roberto",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          )
                                                          : Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: Text(
                                                                "Min. Order ${snapshot.data['products'][index]['quantity']}",
                                                                style: TextStyle(
                                                                  color:
                                                                      Colors.red,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Roberto",
                                                                ),
                                                              ),
                                                          ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /*Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_down_circle_rounded,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      " See more distributors",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roberto",
                                      ),
                                    ),
                                  ],
                                ),
                              )*/
                            ],
                          );
                        })),
              ],
            );
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
