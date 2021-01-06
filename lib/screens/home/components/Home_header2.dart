import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'search_field.dart';
import 'package:tradegood/screens/home/home_screen.dart';
import 'package:tradegood/screens/home/components/popular_product.dart';

class HomeHeader2 extends StatefulWidget {
  const HomeHeader2({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeader2State createState() => _HomeHeader2State();
}

class _HomeHeader2State extends State<HomeHeader2> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: SizeConfig.screenHeight*0.05,
            color: Color.fromARGB(255, 243, 243, 243),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: DropdownButton(
                  value: _value,
                  hint: Text("Categories"),
                  items: [
                    DropdownMenuItem(
                      child: Text("By Brands"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("By Products"),
                      value: 2,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                    if(_value==1)
                      {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                            HomeScreen("Brands","/brand/getBrand",true)),);
                      }
                    else if(_value==2)
                      {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                            HomeScreen("Products","/category/getCategory",false)),);
                      }
                  }),
            ),
          ),
          SearchField(),
        ],
      ),
    );
  }
}
