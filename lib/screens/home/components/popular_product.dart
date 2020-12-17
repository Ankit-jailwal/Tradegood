import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:shop_app/API/Auth/Category.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_category(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "Shop by ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
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
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: IgnorePointer(
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data['categoryList'].length,
                            gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 7, right: 7, bottom: 5),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFFffefaf),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 105,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/c/cf/Tumbler_of_cola_with_ice.jpg"),
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
                                        child: Center(child: Text(
                                          snapshot.data['categoryList']
                                          [index]['name'], style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                ),
              )
            ],
          );
        }
        return Container(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
