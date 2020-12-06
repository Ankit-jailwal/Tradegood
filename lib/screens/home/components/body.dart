import 'package:flutter/material.dart';
import 'package:shop_app/screens/Location_list/location_list.dart';
import 'package:shop_app/screens/home/components/Choose_your_route.dart';
import 'package:shop_app/screens/home/components/Home_header2.dart';
import 'package:shop_app/screens/home/components/home_header1.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  color: Color.fromARGB(255, 53, 112, 190),
                  height: SizeConfig.screenHeight*0.135,
                ),
                Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(8)),
                    HomeHeader1(),
                    SizedBox(height: getProportionateScreenWidth(8)),
                    HomeHeader2(),
                  ],
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(3)),
            DiscountBanner(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(18)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(18)),
          ],
        ),
      ),
    );
  }
}
