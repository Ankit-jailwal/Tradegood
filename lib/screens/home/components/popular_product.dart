import 'package:flutter/material.dart';
import '../../../size_config.dart';

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
                      padding: EdgeInsets.only(left: 5,right: 5,top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFffefaf),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Center(child: Text("Category 1",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
                          )
                        ],
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
