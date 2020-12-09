import 'package:flutter/material.dart';
import 'package:shop_app/screens/Location_list/location_list.dart';
import 'package:shop_app/screens/My_cart/my_cart.dart';
import 'package:shop_app/screens/Wishlist/wishlist.dart';
import 'package:shop_app/screens/home/components/Location.dart';
import 'package:shop_app/screens/order_list_screen/order_screen.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader1 extends StatelessWidget {
  const HomeHeader1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: SizeConfig.screenWidth*0.09,
            color: Colors.white,
          ),
          GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => location_list()));
              },
              child: locationfield()),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishlist()));
            },
            child: Image.asset(
              "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
              color: null,
              fit: BoxFit.cover,
              width: 33.0,
              height: 33.0,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => order_screen()));
            },
            child: Image.asset(
              "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
              color: null,
              fit: BoxFit.cover,
              width: 33.0,
              height: 33.0,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
        ],
      ),
    );

  }
}