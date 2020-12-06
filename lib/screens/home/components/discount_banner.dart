import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../size_config.dart';

final List<String> imgList = [
 "assets/images2/e40383e8af2df51c47006873ee61afab5b197fff.png",
  "assets/images2/e40383e8af2df51c47006873ee61afab5b197fff.png",
  "assets/images2/e40383e8af2df51c47006873ee61afab5b197fff.png",
  "assets/images2/e40383e8af2df51c47006873ee61afab5b197fff.png",
];

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        //final double height = MediaQuery.of(context).size.height;
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: SizeConfig.screenWidth*0.38,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: imgList.map((item) => Container(
                child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, height:SizeConfig.screenWidth*0.38,)
                ),
              )).toList(),
            ),
          ],
        );
      },
    );
  }
}
