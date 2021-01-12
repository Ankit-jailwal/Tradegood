import 'package:flutter/material.dart';
import 'package:tradegood/screens/home/components/home_header.dart';
import '../../../size_config.dart';
import 'discount_banner.dart';
import 'special_offers.dart';
import 'search_field.dart';
import 'package:tradegood/API/getCategory.dart';
import 'package:tradegood/screens/productScreen/productScreen.dart';
import 'package:tradegood/API/signout.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _value = 1;
  String type="Categories";
  String url="/category/getCategory";
  bool flag=false;
  String productUrl='/category/';
  bool reloadFlag=true;
  @override
  Widget build(context) {
    return WillPopScope(
      onWillPop: () async{
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure you want to signout?'),
                actions: <Widget>[
                  FlatButton(
                    child: new Text('No',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.red),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  new FlatButton(
                    child: new Text('Yes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    onPressed: () async{
                      await signout();
                      Navigator.of(context).popUntil(ModalRoute.withName("/sign_in"));
                    },
                  ),

                ],
              );
            });
      },
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      color: Color.fromARGB(255, 53, 112, 190),
                      height: SizeConfig.screenHeight * 0.135,
                    ),
                    Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(8)),
                        HomeHeader1(),
                        SizedBox(height: getProportionateScreenWidth(8)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: SizeConfig.screenHeight * 0.05,
                                color: Color.fromARGB(255, 243, 243, 243),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: DropdownButton(
                                      value: _value,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("By Categories"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("By Brands"),
                                          value: 2,
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value == 1) {
                                          if(value!=_value)
                                          setState(() {
                                            _value = 1;
                                             type="Categories";
                                             url="/category/getCategory";
                                             productUrl='/category/';
                                             flag=false;
                                            reloadFlag=false;
                                          });
                                        } else if (value == 2) {
                                          if(value!=_value)
                                            setState(() {
                                              _value = 2;
                                              type="Brands";
                                              url="/brand/getBrand";
                                              productUrl='/brand/';
                                              flag=true;
                                              reloadFlag=false;
                                            });
                                        }
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: SearchField(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenWidth(3)),
                    DiscountBanner(),
                    SpecialOffers(),
                    SizedBox(height: getProportionateScreenWidth(18)),
                    FutureBuilder(
                      future: get_category(url),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
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
                                        itemCount:flag
                                            ? snapshot.data['brandList'].length
                                            : snapshot.data['categoryList'].length,
                                        gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        itemBuilder: (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => order_screen(
                                                        flag?"$productUrl${snapshot.data['brandList'][index]['name']}"
                                                            : "$productUrl${snapshot.data['categoryList'][index]['name']}",
                                                        snapshot.data,flag,index)),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  left: 7,
                                                  right: 7,
                                                  bottom: 5),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    top: 8,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  color: Color(0xFFffefaf),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      height: SizeConfig.screenWidth*0.26,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(15),
                                                          image: DecorationImage(
                                                              image: NetworkImage(flag
                                                                  ? snapshot.data['brandList']
                                                              [index][
                                                              'brandImage']??
                                                                  "https://748073e22e8db794416a-cc51ef6b37841580002827d4d94d19b6.ssl.cf3.rackcdn.com/not-found.png"
                                                                  : snapshot.data['categoryList']
                                                              [index][
                                                              'categoryImage'] ??
                                                                  "https://748073e22e8db794416a-cc51ef6b37841580002827d4d94d19b6.ssl.cf3.rackcdn.com/not-found.png"),
                                                              fit: BoxFit.cover)),
                                                    ),
                                                    SizedBox(
                                                      height: double.minPositive,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(10),
                                                          color: Colors.white),
                                                      child: Center(
                                                          child: Text(flag
                                                              ? snapshot.data['brandList']
                                                          [index]['name']
                                                              : snapshot.data[
                                                          'categoryList']
                                                          [index]['name'],
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                            textAlign: TextAlign.center,
                                                          )),
                                                    ),
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
                    ),
                    SizedBox(height: getProportionateScreenWidth(18)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
