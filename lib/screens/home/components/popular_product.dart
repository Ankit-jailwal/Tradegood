import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';
final List<String> img = [
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
  'assets/images2/ef66e7a156bb12046450fe31c964d9878ae491f6.png',
];
class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:Text(
            "Shop by Category",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Container(
          color: Colors.deepOrange.withOpacity(0.4),
          child: IgnorePointer(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: img.map((item) => Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Transform.translate(
                      offset: Offset(50, -50),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Icon(Icons.bookmark_border, size: 15,),
                      ),
                    ),
                  ),
                )).toList(),
              )
          ),
        )
      ],
    );
  }
}
