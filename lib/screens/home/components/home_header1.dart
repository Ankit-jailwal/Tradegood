import 'package:flutter/material.dart';
import 'package:tradegood/screens/Location_list/location_list.dart';
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/screens/My_cart/CartFilled/my_cart.dart';
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/screens/Wishlist/Wishlist_empty/wishlist.dart';
import 'package:tradegood/screens/home/components/Location.dart';
import 'package:tradegood/screens/order_list_screen/order_screen.dart';
import '../../../size_config.dart';
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
          GestureDetector(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: SizeConfig.screenWidth*0.09,
              color: Colors.white,
            ),
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
                  MaterialPageRoute(builder: (context) => cart_screen()));
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
