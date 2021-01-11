import 'package:flutter/material.dart';
import 'package:tradegood/screens/home/components/search_field.dart';
import 'package:tradegood/size_config.dart';
import 'components/body.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';

class order_screen extends StatefulWidget {
  String productUrl;
  var catData;
  int index;
  bool flag;
  order_screen(this.productUrl,this.catData,this.flag,this.index);
  static String routeName = "/cart";

  @override
  _order_screenState createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("${widget.flag?widget.catData['brandList'][widget.index]['name']:widget.catData['categoryList'][widget.index]['name']}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),),
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
      body: Body(widget.productUrl,widget.catData,widget.flag),
    );
  }
}