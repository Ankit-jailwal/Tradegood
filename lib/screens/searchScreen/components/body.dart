import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:toast/toast.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/noItemsAvailable/components/Body.dart';
import 'package:tradegood/screens/searchScreen/components/productButton.dart';
import 'package:tradegood/screens/searchScreen/components/wishListButton.dart';
import 'package:tradegood/API/productRating.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tradegood/API/getWishlist.dart';

class Body extends StatefulWidget {
  var data;
  Body(this.data);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool pseudoFlag;
  Future updatePage() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      pseudoFlag=true;
    }
    );
  }
  Color checkStock(int stock)
  {
    Color color;
    if(stock>=400)
    {
      color=Colors.lightGreen;
    }
    else if(stock>=100&&stock<400)
    {
      color=Colors.yellow;
    }
    else
      color=Colors.red;

    return color;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWishlist(),
      builder: (context, wishlistItem) {
        if (wishlistItem.hasData) {
          return Column(
            children: <Widget>[
              Expanded(
                  child: widget.data != null ? ListView.builder(
                      itemCount: widget.data['product'].length,
                      //list view declaration
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
                                                    widget
                                                        .data['product']
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
                                                          widget.data[
                                                          'product']
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
                                                              "₹${widget
                                                                  .data['product'][index]['mrp']
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
                                                              "₹${widget
                                                                  .data['product'][index]['ptr']
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
                                                        "Quantity: ${widget
                                                            .data['product'][index]['quantity']}",
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
                                                      SizedBox(height: 5,),
                                                      GestureDetector(
                                                        onTap: (){
                                                          showModalBottomSheet(
                                                            enableDrag: true,
                                                            isDismissible: true,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(24),
                                                                topRight: Radius.circular(24),
                                                              ),
                                                            ),
                                                            barrierColor: Colors.black45.withOpacity(0.2),
                                                            context: context,
                                                            builder: (context) => Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: <Widget>[
                                                                SizedBox(height: 10,),
                                                                Text(widget.data['product'][index]['name'],style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                                                                SizedBox(height: 10,),
                                                                Column(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left:10.0,right: 10),
                                                                      child: RichText(
                                                                        text: TextSpan(
                                                                          children: <TextSpan>[
                                                                            TextSpan(
                                                                              text: 'Description: ',
                                                                              style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                                                            TextSpan(
                                                                              text: widget.data['product'][index]['description'],
                                                                              style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 10,)
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
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
                                                                        0,
                                                                        3),
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
                                                                  "Description"),
                                                            )),
                                                      ),
                                                    ]),
                                                    wishListButton(
                                                        widget.data, index,
                                                        wishlistItem.data)
                                                  ]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        widget.data['product'][index]['offer'] != null ? Padding(
                                              padding: const EdgeInsets.only(left:20.0),
                                              child: Align(
                                          alignment:Alignment.centerLeft,
                                                child: RichText(
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
                                                      widget.data[
                                                      'product']
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
                                              ),
                                            ) : Container(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: (widget.data['product'][index]['availableStock']<widget.data['product'][index]['minQuantity'])?CrossAxisAlignment
                                                .center:CrossAxisAlignment
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
                                                    (widget.data['product'][index]['availableStock']<widget.data['product'][index]['minQuantity'])?Container():Row(
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          size: 14,
                                                          color: checkStock(
                                                              widget
                                                                  .data['product'][index]['availableStock']),
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
                                                          widget.data[
                                                          'product']
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
                                                            rating: widget
                                                                .data['product'][index]['rating']
                                                                .toDouble(),
                                                            isReadOnly: true,
                                                            filledIconData: Icons
                                                                .star,
                                                            halfFilledIconData: Icons
                                                                .star,
                                                            color: Colors
                                                                .yellow,
                                                            borderColor: Colors
                                                                .grey,
                                                            spacing: 0.0
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
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
                                                                productRating(
                                                                    feedback['rating'],
                                                                    feedback['feedback'],
                                                                    widget
                                                                        .data['product'][index]['_id']);
                                                                // map { rating: 2, feedback: 'some feedback' }
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                                Toast.show(
                                                                    "Thanks for your feedback",
                                                                    context,
                                                                    duration: Toast
                                                                        .LENGTH_SHORT,
                                                                    gravity: Toast
                                                                        .BOTTOM);
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
                                              (widget.data['product'][index]['availableStock']<widget.data['product'][index]['minQuantity'])?Padding(
                                                padding: const EdgeInsets.only(right:40.0),
                                                child: Text("OUT OF STOCK",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w900),),
                                              ):productButton(widget.data, index)
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
                      }) : noItemBody()),
            ],
          );
        }
        return Center(child: Container(child: CircularProgressIndicator()));
      }
    );
  }
}






