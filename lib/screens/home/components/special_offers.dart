import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:tradegood/API/getStaticOffer.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStaticOffer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Container(
                  height: getProportionateScreenWidth(140),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data['offerImages'].length,
                    itemBuilder: (BuildContext context, int index) =>
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: getProportionateScreenWidth(180),
                                  height: getProportionateScreenWidth(140),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        snapshot.data['offerImages'][index],
                                        fit: BoxFit.fill,
                                      )),
                                )),
                          ],
                        ),
                  ),
                ),
              ],
            );
          }
          return Container();
        });
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
                decoration: BoxDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
