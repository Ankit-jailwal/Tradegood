import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
          decoration:
              BoxDecoration(color: Colors.orangeAccent.withOpacity(0.3)),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => Container(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 15),
                      child: Text(
                        'Category 1',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roberto"),
                      ))),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 4, //list view declaration
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
                              Padding(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Abc Distributor's Name",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roberto",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    ]),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 15),
                                        child: Container(
                                          height: SizeConfig.screenHeight * 0.22,
                                          child: Image.asset(
                                              "assets/images2/6d9832a493c3de8137461d975e7a6e0b00605a06.png"),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: 10, bottom: 10),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Text(
                                                  "Product Name Here",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily: "Roberto",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      SizeConfig.screenWidth * 0.05,
                                                ),
                                                Row(
                                                  children: [
                                                    Column(children: [
                                                      Text(
                                                        "M.R.P",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: "Roberto",
                                                        ),
                                                      ),
                                                      Text(
                                                        "₹500",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: "Roberto",
                                                        ),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      width:
                                                          SizeConfig.screenWidth *
                                                              0.04,
                                                    ),
                                                    Column(children: [
                                                      Text(
                                                        "P.T.R",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily: "Roberto",
                                                        ),
                                                      ),
                                                      Text(
                                                        "₹450",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: "Roberto",
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
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roberto",
                                                  ),
                                                ),
                                              ]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 25,
                                                child: Image.asset(
                                                  "assets/images2/f99614dc8ffdca073f67f7261c6a80fbbe774e29.png",
                                                ),
                                              ),
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
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black)),
                                        TextSpan(
                                            text:
                                                ' Current Schemes offered by the distributor',
                                            style: TextStyle(color: Colors.red)),
                                      ],
                                      style: DefaultTextStyle.of(context).style,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    size: 14,
                                                    color: Colors.lightGreen,
                                                  ),
                                                  SizedBox(
                                                    width: SizeConfig.screenWidth *
                                                        0.008,
                                                  ),
                                                  Text(
                                                    "Available Stock",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Roberto",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          SizeConfig.screenWidth *
                                                              0.02),
                                                  Text(
                                                    "400",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w800,
                                                      fontFamily: "Roberto",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Rating:",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Roberto",
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              Container(
                                                height:
                                                    SizeConfig.screenHeight * 0.06,
                                                width:
                                                    SizeConfig.screenWidth * 0.25,
                                                decoration: BoxDecoration(

                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(left: 7),
                                                      child: Text(
                                                        "ADD",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: "Roberto",
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                                        Icon(
                                                          Icons.remove,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          SizeConfig.screenWidth *
                                                              0.025,
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      child: Image.asset(
                                                        "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "Min. Order 10kg",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Roberto",
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
                      Padding(
                        padding:EdgeInsets.only(top:5,bottom:5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_drop_down_circle_rounded,
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
                      )
                    ],
                  );
                })),
      ],
    );
  }
}
