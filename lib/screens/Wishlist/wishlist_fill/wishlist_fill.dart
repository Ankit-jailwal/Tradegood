import 'package:flutter/material.dart';
import 'package:tradegood/API/getWishlist.dart';
import 'package:tradegood/screens/Wishlist/Wishlist_empty/wishlist.dart';
import 'package:tradegood/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:tradegood/API/removeItemWishlist.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/addToCart.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';


class wishListScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _wishListScreenState createState() => _wishListScreenState();
}

class _wishListScreenState extends State<wishListScreen> {
  bool flag;
  bool checkWishList(var data){
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
  var removeData;
  void update(bool flagUpdate) {
    flag=flagUpdate;
    setState(() {} );
    
  }
  bool pseudoFlag;
  Future updatePage() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      pseudoFlag=true;
    }
    );
  }
  bool updateScreenFlag;
  void updateCart(bool pseudoFlag) {
    setState(() => updateScreenFlag=true);
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
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => my_order()));
            },
            child: Image.asset(
              "assets/images2/order.png",
              width: 33,
              height: 33,
            ),
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
      body: Builder(
        builder: (BuildContext context) {
      return OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected =
                connectivity != ConnectivityResult.none;
            return !connected?noInternet():RefreshIndicator(
              onRefresh:updatePage,
              child: FutureBuilder(
                  future: getWishlist(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      removeData=snapshot.data;
                      return checkWishList(snapshot.data)? Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data['wishlist']['wishlistItems'].length, //list view declaration
                                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                                  itemBuilder: (BuildContext context, int index) {
                                    var item=removeData['wishlist']['wishlistItems'];
                                    return Dismissible(
                                      key: Key(item.toString()),
                                      direction: DismissDirection.horizontal,
                                      child: Column(
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
                                                                snapshot.data['wishlist']['wishlistItems'][index]['product']['name'],
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight
                                                                        .w800),
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            SmoothStarRating(
                                                                allowHalfRating: false,
                                                                starCount: 5,
                                                                rating: snapshot.data['wishlist']['wishlistItems'][index]['product']['rating'].toDouble(),
                                                                isReadOnly:true,
                                                                filledIconData: Icons.star,
                                                                halfFilledIconData: Icons.star,
                                                                color: Colors.yellow,
                                                                borderColor: Colors.grey,
                                                                spacing:0.0
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
                                                                          .w800),
                                                                ),
                                                                SizedBox(width: 16,),
                                                                Text(
                                                                  "₹${snapshot.data['wishlist']['wishlistItems'][index]['product']['ptr'].toString()}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight
                                                                          .w800),
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
                                                                    snapshot.data['wishlist']['wishlistItems'][index]['product']['productPicture'])),
                                                            GestureDetector(
                                                              onTap: () async{
                                                                await removeItemWishlist(removeData['wishlist']['wishlistItems'][index]['product']['_id']);
                                                                Toast.show("${removeData['wishlist']['wishlistItems'][index]['product']['name']} removed from wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                                                removeData['wishlist']['wishlistItems'].removeAt(index);
                                                                setState(() {
                                                                  updateCart(true);
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          snapshot.data['wishlist']['wishlistItems'][index]['product']['offer']!=null?Container(
                                                            width: SizeConfig
                                                                .screenWidth *
                                                                0.5,
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
                                                                      text: ' ${snapshot.data['wishlist']['wishlistItems'][index]['product']['offer']}',
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors
                                                                              .redAccent,
                                                                          fontSize: 12),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ):Container(),
                                                          addToCartButton(snapshot.data,index)
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
                                      ),
                                      onDismissed: (direction) async{
                                        await removeItemWishlist(removeData['wishlist']['wishlistItems'][index]['product']['_id']);
                                        Toast.show("${removeData['wishlist']['wishlistItems'][index]['product']['name']} removed from wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                        removeData['wishlist']['wishlistItems'].removeAt(index);
                                        setState(() {
                                          updateCart(true);
                                        });
                                      },
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
          },
          child: Container()
      );
    },
    )
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
    return widget.data['wishlist']['wishlistItems'][widget.index]['product']['availableStock']<widget.data['wishlist']['wishlistItems'][widget.index]['product']['minQuantity']?Padding(
      padding: const EdgeInsets.only(right:10.0),
      child: Text("OUT OF STOCK",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w900),),
    ):GestureDetector(
      onTap: (){
        setState(() {
            Toast.show("Item added in cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            addToCart(widget.data['wishlist']['wishlistItems'][widget.index]['product']['_id'],widget.data['wishlist']['wishlistItems'][widget.index]['product']['quantity'],);
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
