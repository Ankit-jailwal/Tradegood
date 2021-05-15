import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';
import 'package:flutter/cupertino.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/home/home_screen.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';

class orderPlaced extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen("Categories","/category/getCategory",false)),
            );
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 33,
            color: Colors.white,
          ),
        ),
        title:Text("Order Placed",
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishListScreen()));
            },
            child: Image.asset(
              "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
              width: 33,
              height: 33,
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02,),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => my_order()));
              },
              child: Image.asset(
                "assets/images2/order.png",
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.screenWidth*0.75,
              child: Image.asset(
                  "assets/images2/orderPlaced.jpg"
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            Container(
              width: SizeConfig.screenWidth*0.75,
              child: Text("Our team will get in touch with you for your order's confirmation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Roberto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight*0.04,),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen("Categories","/category/getCategory",false)),
                );
              },
              child: Container(
                height: SizeConfig.screenHeight*0.06,
                width: SizeConfig.screenWidth*0.6,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Continue Shopping",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Roberto",
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}