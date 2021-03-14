import 'package:flutter/material.dart';
import 'package:tradegood/screens/Location_list/location_list.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:tradegood/screens/home/components/Location.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';

class HomeHeader1 extends StatelessWidget {
  var userData;
  HomeHeader1(this.userData);


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
              child: locationField(userData)),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => wishListScreen()));
                },
                child: Image.asset(
                  "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
                  fit: BoxFit.cover,
                  width: 33.0,
                  height: 33.0,
                  colorBlendMode: BlendMode.dstATop,
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth*0.02,),
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

        ],
      ),
    );

  }
}
