import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(3)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width:getProportionateScreenWidth(4.0), ),
              SpecialOfferCard(
                image: "assets/images2/0d827966a31c53693c760401ca123ae238bf82471.png",
                //category: "Smartphone",
                press: () {},
              ),
              SizedBox(width:getProportionateScreenWidth(7.0), ),
              SpecialOfferCard(
                image: "assets/images2/0d827966a31c53693c760401ca123ae238bf82472.png",
                //category: "Fashion",
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.image,
    @required this.press,
  }) : super(key: key);

  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(180),
        height: getProportionateScreenWidth(140),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
