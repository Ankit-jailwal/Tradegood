import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/size_config.dart';
import 'components/body.dart';

class order_screen extends StatelessWidget {
  String category;
  var catData;
  order_screen(this.category,this.catData);
  static String routeName = "/cart";
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
        title:SearchField(),
        actions: [
          Image.asset(
            "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
            width: 33,
            height: 33,
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02,),
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
      body: Body(category,catData),
    );
  }
}