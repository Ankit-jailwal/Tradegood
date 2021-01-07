import 'package:flutter/material.dart';
import 'package:tradegood/API/getWishlist.dart';
import 'package:tradegood/screens/Wishlist/Wishlist_empty/wishlist.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/components/Body.dart';

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
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
            child: Image.asset(
              "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
              width: 33,
              height: 33,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getWishlist(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return checkWishList(snapshot.data)? Body(snapshot.data): wishlist();
            }
            return Center(child: Container(child: CircularProgressIndicator()));
          }
            ),
    );
  }
}
