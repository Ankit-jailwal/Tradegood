import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/API/getCategory.dart';
import 'package:tradegood/screens/order_list_screen/order_screen.dart';

class PopularProducts extends StatelessWidget {
   String type;
   String url;
   bool flag=false;
  PopularProducts(this.type,this.url,this.flag);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_category(url) ,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "Shop by $type",
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
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: flag?snapshot.data['brandList'].length:snapshot.data['categoryList'].length,
                        gridDelegate:
                        new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                             // print("adasdas");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => order_screen(snapshot.data['categoryList'][index]['name'],snapshot.data)),
                              );
                            },
                            child: Padding(
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
                                      height: 114,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(flag?snapshot.data['categoryList']
                                              [index]['categoryImage']??"https://748073e22e8db794416a-cc51ef6b37841580002827d4d94d19b6.ssl.cf3.rackcdn.com/not-found.png":snapshot.data['categoryList']
                                              [index]['categoryImage']??"https://748073e22e8db794416a-cc51ef6b37841580002827d4d94d19b6.ssl.cf3.rackcdn.com/not-found.png"),
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
                                        flag?snapshot.data['categoryList']
                                        [index]['name']:snapshot.data['categoryList']
                                        [index]['name'], style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          );
        }

        return Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
