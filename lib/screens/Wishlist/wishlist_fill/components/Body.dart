import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/removeItemWishlist.dart';

class Body extends StatefulWidget {
  var wishData;
  Body(this.wishData);
  @override
  _BodyState createState() => _BodyState(wishData);
}

class _BodyState extends State<Body> {
  var wishData;
  _BodyState(this.wishData);
  bool wishCheck=true;
  @override
  Widget build(BuildContext context) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: wishData['wishlist']['wishlistItems'].length, //list view declaration
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder(
                          builder: (context, data) {
                            if(data.hasData){
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
                                                      width: SizeConfig
                                                          .screenWidth *
                                                          0.6,
                                                      child: Text(
                                                        data.data['product'][0]['name'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w500),
                                                      ),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.yellow,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.yellow,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.yellow,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.yellow,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.yellow,
                                                          size: 20,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                      SizeConfig.screenHeight *
                                                          0.025,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "P.T.R",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .w500),
                                                        ),
                                                        SizedBox(width: 16,),
                                                        Text(
                                                          data.data['product'][0]['ptr'].toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight
                                                                  .w500),
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: SizeConfig
                                                            .screenWidth * 0.15,
                                                        child: Image.network(
                                                            data.data['product'][0]['productPicture'])),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (wishCheck == true)
                                                          {
                                                            removeItemWishlist(data.data['product'][0]['_id'].toString());
                                                          wishCheck = false;
                                                          }
                                                          else
                                                          {
                                                          wishCheck = true;
                                                          }
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .only(
                                                            left: 15),
                                                        child: wishCheck ? Image
                                                            .asset(
                                                          "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
                                                          height: 25,) : Image
                                                            .asset(
                                                          "assets/images2/f99614dc8ffdca073f67f7261c6a80fbbe774e29.png",
                                                          height: 25,),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: SizeConfig
                                                        .screenWidth *
                                                        0.6,
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text:
                                                          '%',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: ' Current Schemes Offered by the distributor',
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors
                                                                      .redAccent,
                                                                  fontSize: 12),
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                  data.data['product'][index]['availableStock']==0?Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Text("OUT OF STOCK",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                                                  ):Container(
                                                    height: SizeConfig
                                                        .screenHeight *
                                                        0.05,
                                                    width: SizeConfig
                                                        .screenWidth *
                                                        0.24,
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .orangeAccent,
                                                      //border:
                                                      //    Border.all(color: Colors.grey),
                                                      borderRadius:
                                                      BorderRadius.circular(3),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                                                          width: 14,),
                                                        Text(
                                                          "Add to cart",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight: FontWeight
                                                                  .w700),
                                                        ),
                                                      ],
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
                                ],
                              );
                            }
                            return Container();
                          }
                        );
                      }

                  )),

            ],
          );
  }
}
