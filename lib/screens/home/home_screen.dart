import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';
import 'components/body.dart';
import 'package:tradegood/screens/My_profile/my_profile.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';
import 'package:tradegood/screens/contact_us/contactUs.dart';
import 'package:tradegood/API/authentication.dart';
import 'package:tradegood/screens/aboutUs/aboutUs.dart';

class HomeScreen extends StatefulWidget {
String type;
String url;
bool flag;
HomeScreen(this.type,this.url,this.flag,);
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
Future userData() async{
  String info= await storage.read(key: 'userInfo');
  print("Infoooo:$info");
  return info;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: Container(
        width: SizeConfig.screenWidth * 0.7,
        child: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.screenHeight * 0.015,
                ),
                ListTile(
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                              "assets/images2/fab7aa80f5a873babf8ce033863e11ae0ddb8547.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, ${userData()}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: "Welcome to ",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                      text: "Trade",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "Good",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold)),
                                ]),
                              )
                            ]),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/3cc61b6529c0b380ec7b41b0ed5db8a3e9d8cf75.png",
                    ),
                  ),
                  title: Text(
                    'My Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => my_profile()),
                      );
                    }
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/10563236aa4a0a4c4eba8ad5f74088af9fa3e9a3.png",
                    ),
                  ),
                  title: Text(
                    'My Orders',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => my_order()),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/f99614dc8ffdca073f67f7261c6a80fbbe774e29.png",
                    ),
                  ),
                  title: Text(
                    'Wishlist',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => wishListScreen()));
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/6af49a59395098f834a89028533f5d579661be03.png",
                    ),
                  ),
                  title: Text(
                    'My cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/c573bd62485e4fbaee31e4af48f7332fbe745b55.png",
                    ),
                  ),
                  title: Text(
                    'Current Routes',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/93e25bbde0a742185a3decda9a7f80becd5d0bcb.png",
                    ),
                  ),
                  title: Text(
                    'Schemes/Offers',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/cf35c2f45bed075f5afd15de2045771d953dec33.png",
                    ),
                  ),
                  title: Text(
                    'Distributors',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/5652c9d833f07619f7c4f8c1ff9bfc340d425572.png",
                    ),
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => contactUs()));
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/a324eda9b18e9189b0453af325faa78a10b38732.png",
                    ),
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => aboutUs()));
                  },
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/26acb0290f1027f5ec8621691e1fd782ca90324d.png",
                    ),
                  ),
                  title: Text(
                    'Feedback',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return QuickFeedback(
                          title: 'Leave a feedback', // Title of dialog
                          showTextBox: true, // default false
                          textBoxHint:
                          'Share your feedback', // Feedback text field hint text default: Tell us more
                          submitText: 'SUBMIT', // submit button text default: SUBMIT
                          onSubmitCallback: (feedback) {
                            print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
                            Navigator.of(context).pop();
                          },
                          askLaterText: 'ASK LATER',
                          onAskLaterCallback: () {
                            print('Do something on ask later click');
                          },
                        );
                      },
                    );},
                ),
                ListTile(
                  leading: Container(
                    width: SizeConfig.screenWidth*0.095,
                    child: Image.asset(
                      "assets/images2/1ee94de249fcfd41cde38e7fe7daea4b0f472cfd.png",
                    ),
                  ),
                  title: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  thickness:1,
                ),
                ListTile(
                  title: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
