import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:toast/toast.dart';
import '../../../size_config.dart';
import 'package:tradegood/API/getProduct.dart';
import 'package:tradegood/screens/noItemsAvailable/components/Body.dart';
import 'package:tradegood/screens/productScreen/components/productButton.dart';
import 'package:tradegood/screens/productScreen/components/wishListButton.dart';
import 'package:tradegood/API/productRating.dart';

class ItemData{
  String Name;
  int Counter;
  bool ShouldVisible;
  ItemData({
    this.Name,
    this.Counter,
    this.ShouldVisible
  });
}

class Body extends StatefulWidget {
  String productUrl;
  var catData;
  bool flag;
  Body(this.productUrl, this.catData,this.flag);
  @override
  _BodyState createState() => _BodyState(productUrl, catData,flag);
}

class _BodyState extends State<Body> {
  String productUrl;
  var catData;
  bool flag;
  _BodyState(this.productUrl, this.catData,this.flag);
  List<bool> navList = List();
    Widget productState(){


      }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProduct(productUrl),
        builder: (context, snapshot) {
          if (snapshot.data!=null){
            if (snapshot.data.length!= 0){
              return Column(
                children: <Widget>[
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
                                            color: Colors.black.withOpacity(
                                                0.5),
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
                                                  padding: const EdgeInsets
                                                      .only(
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
                                                        snapshot
                                                            .data['products']
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
                                                                  "₹${snapshot
                                                                      .data['products'][index]['mrp']
                                                                      .toString()}",
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
                                                                  "₹${snapshot
                                                                      .data['products'][index]['ptr']
                                                                      .toString()}",
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
                                                        wishListButton(
                                                            snapshot.data,
                                                            index)
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
                                                      snapshot.data[
                                                      'products']
                                                      [index]['offer'],
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                ],
                                                style:
                                                DefaultTextStyle
                                                    .of(context)
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
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .end,
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
                                                        SizedBox(height: 5,),
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
                                                            SmoothStarRating(
                                                                allowHalfRating: false,
                                                                starCount: 5,
                                                                rating: snapshot.data['products'][index]['rating'].toDouble(),
                                                                isReadOnly:true,
                                                                filledIconData: Icons.star,
                                                                halfFilledIconData: Icons.star,
                                                                color: Colors.yellow,
                                                                borderColor: Colors.grey,
                                                                spacing:0.0
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 5,),
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder: (
                                                                  context) {
                                                                return QuickFeedback(
                                                                  title: 'Leave a feedback',
                                                                  // Title of dialog
                                                                  showTextBox: true,
                                                                  // default false
                                                                  textBoxHint: 'Share your feedback',
                                                                  // Feedback text field hint text default: Tell us more
                                                                  submitText: 'SUBMIT',
                                                                  // submit button text default: SUBMIT
                                                                  onSubmitCallback: (
                                                                      feedback) {
                                                                    print('${feedback['rating']}');
                                                                    productRating(feedback['rating'],feedback['feedback'],snapshot.data['products'][index]['_id']);
                                                                    // map { rating: 2, feedback: 'some feedback' }
                                                                    Navigator.of(context).pop();
                                                                    Toast.show("Thanks for your feedback", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                                                  },
                                                                  askLaterText: 'ASK LATER',
                                                                  onAskLaterCallback: () {
                                                                    print(
                                                                        'Do something on ask later click');
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      5),
                                                                  boxShadow: [
                                                                    new BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                          0.3),
                                                                      blurRadius: 3,
                                                                      offset: Offset(
                                                                          0, 3),
                                                                    ),
                                                                  ]
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    top: 3,
                                                                    bottom: 3,
                                                                    left: 10,
                                                                    right: 10),
                                                                child: Text(
                                                                    "Write a review"),
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  productButton(
                                                      snapshot.data, index)
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
            else {
              return noItemBody();
            }
          }
          return Center(child: Container(child: CircularProgressIndicator()));
        }

          );
  }
}

class navigationBar extends StatefulWidget {
  @override
  _navigationBarState createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: Colors.orangeAccent.withOpacity(0.3)),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
       // itemCount: flag?catData['brandList'].length:catData['categoryList'].length,
        itemBuilder: (BuildContext context, int index) =>
            GestureDetector(
          //    onTap: () {
          //      print("pressed item$index");
          //      Navigator.push(
          //        context,
          //        MaterialPageRoute(
          //            builder: (context) => order_screen(
          //                flag?catData['brandList'][index]['name']:catData['categoryList'][index]['name'],
          //                catData,flag)),
          //      );
          //    },
              child: Container(
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 15),
                        child: Text(
                          "flag?catData['brandList'][index]['name']:catData['categoryList'][index]['name']",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roberto"),
                        ))),
              ),
            ),
      ),
    );
  }
}




