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
        SizedBox(height: getProportionateScreenWidth(10)),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFfff7e8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IgnorePointer(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: img.map((item) => Padding(
                    padding: EdgeInsets.only(top:10,left: 7,right: 7,bottom: 5),
                    child: Container(
                      padding: EdgeInsets.only(left: 2,right: 2,top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFffefaf),
                      ),
                      child: Card(
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
                        ),
                      ),
                    ),
                  )).toList(),
                )
            ),
          ),
        )
      ],
    );
  }
}
