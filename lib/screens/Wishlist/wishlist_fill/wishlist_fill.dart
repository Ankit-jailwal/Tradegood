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
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';


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
      body: RefreshIndicator(
        onRefresh:updatePage,
        child: FutureBuilder(
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
                              var item=snapshot.data['wishlist']['wishlistItems'];
                              return Dismissible(
                                key: Key(item.toString()),
                                direction: DismissDirection.horizontal,
                                child: FutureBuilder(
                                    future: getProductByID(snapshot.data['wishlist']['wishlistItems'][index]['product']),
                                    builder: (context, data) {
                                      if(data.hasData){
                                        return wishListItem(data.data,index,update,snapshot.data,updateCart);
                                      }
                                      return Container();
                                    }
                                ),
                                onDismissed: (direction) async{
                                  await removeItemWishlist(snapshot.data['wishlist']['wishlistItems'][index]['product'].toString());
                                  snapshot.data['wishlist']['wishlistItems'].removeAt(index);
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
      ),
    );
  }
}
class wishListItem extends StatefulWidget {
  var wishListData;
  int index;
  var Data;
  final ValueChanged<bool> update;
  final ValueChanged<bool> updateWishlist;
  wishListItem(this.wishListData,this.index,this.update,this.Data,this.updateWishlist);
  @override
  _wishListItemState createState() => _wishListItemState();
}

class _wishListItemState extends State<wishListItem> {
  bool wishCheck = true;
  @override
  Widget build(BuildContext context) {
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
                              widget.wishListData['product'][0]['name'],
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
                              rating: widget.wishListData['product'][0]['rating'].toDouble(),
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
                                "₹${widget.wishListData['product'][0]['ptr'].toString()}",
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
                                  widget.wishListData['product'][0]['productPicture'])),

                          GestureDetector(
                            onTap: () async{

                              widget.Data['wishlist']['wishlistItems'].removeAt(widget.index);
                              await removeItemWishlist(widget.wishListData['product'][0]['_id'].toString());
                              Toast.show("${widget.wishListData['product'][0]['name']} removed from wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                              widget.updateWishlist(true);
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
                        widget.wishListData['product'][0]['offer']!=null?Container(
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
                                    text: ' ${widget.wishListData['product'][0]['offer']}',
                                    style: TextStyle(
                                        color:
                                        Colors
                                            .redAccent,
                                        fontSize: 12),
                                  )
                                ]),
                          ),
                        ):Container(),
                        addToCartButton(widget.wishListData,widget.index)
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
