import 'package:flutter/material.dart';
import 'package:tradegood/API/getWishlist.dart';
import 'package:tradegood/screens/Wishlist/Wishlist_empty/wishlist.dart';
import 'package:tradegood/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:tradegood/API/getProductById.dart';
import 'package:tradegood/API/removeItemWishlist.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/addToCart.dart';


class wishListScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _wishListScreenState createState() => _wishListScreenState();
}

class _wishListScreenState extends State<wishListScreen> {
  bool wishCheck = true;
  bool checkWishList(var data){
    bool flag;
    if(data.length==0)
    {
      flag= false;
    }
    else if(data['wishlist']['wishlistItems'].length!=0)
      {
       flag= true;
      }
    else
      flag=false;
    return flag;
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
        title: Text(
          "Wishlist  ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Image.asset(
            "assets/images2/f12e59ae8e5ecc4e4fa1ed606e384e238ff3c013.png",
            width: 33,
            height: 33,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.02,
          ),
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
          future: getWishlist(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return checkWishList(snapshot.data)? Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data['wishlist']['wishlistItems'].length, //list view declaration
                          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                          itemBuilder: (BuildContext context, int index) {
                            return FutureBuilder(
                                future: getProductByID(snapshot.data['wishlist']['wishlistItems'][index]['product']),
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
                                                                "₹${data.data['product'][0]['ptr'].toString()}",
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
                                                                  Toast.show("${data.data['product'][0]['name']} removed from wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                                                  wishCheck = false;
                                                                }
                                                              });
                                                            },
                                                            child: Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    left: 15),
                                                                child: Image
                                                                    .asset(
                                                                  "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
                                                                  height: 25,)
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
                                                                    text: ' ${data.data['product'][0]['offer']}',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors
                                                                            .redAccent,
                                                                        fontSize: 12),
                                                                  )
                                                                ]),
                                                          ),
                                                        ),
                                                        addToCartButton(data.data,index)
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
              ): wishlist();
            }
            return Center(child: Container(child: CircularProgressIndicator()));
          }
            ),
    );
  }
}

class addToCartButton extends StatefulWidget {
  var data;
  int index;
  addToCartButton(this.data,this.index);
  @override
  _addToCartButtonState createState() => _addToCartButtonState();
}

class _addToCartButtonState extends State<addToCartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
            Toast.show("Item added in cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            addToCart(widget.data['product'][0]['_id'],widget.data['product'][0]['quantity'],);
            print("SUCCESS");
        });
      },
      child: Container(
        height: SizeConfig
            .screenHeight * 0.05,
        width: SizeConfig
            .screenWidth * 0.24,
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
      ),
    );
  }
}
