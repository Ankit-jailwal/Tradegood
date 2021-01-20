import 'package:flutter/material.dart';
import 'package:frefresh/frefresh.dart';
import 'package:quick_feedback/quick_feedback.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';
import 'components/body.dart';
import 'package:tradegood/screens/My_profile/my_profile.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';
import 'package:tradegood/screens/contact_us/contactUs.dart';
import 'package:tradegood/API/getUserInfo.dart';
import 'package:tradegood/screens/aboutUs/aboutUs.dart';
import 'package:tradegood/screens/My_cart/CartFilled/my_cart.dart';
import 'package:tradegood/screens/Location_list/location_list.dart';
import 'package:tradegood/screens/termsAndConditions/termsAndConditions.dart';
import 'package:tradegood/API/signout.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:tradegood/API/applicationRating.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/screens/additionalInfo/additionalInfo.dart';


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
  bool pseudoFlag;
  Future updatePage() async{
    await Future.delayed(Duration(seconds: 2));
     setState(() {
      pseudoFlag=true;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: updatePage,
      child: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
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
                              snapshot.data['user']['profilePicture']==null?CircleAvatar(
                                backgroundColor: Colors.black12,
                                radius: 26,
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                        "assets/images2/fab7aa80f5a873babf8ce033863e11ae0ddb8547.png")
                                ),
                              ):Container(
                                height: 52,
                                width: 52,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: Image.network(snapshot.data['user']['profilePicture'],fit: BoxFit.fill,)),),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:SizeConfig.screenWidth * 0.45,
                                        child: Text(
                                          'Hello, ${snapshot.data['user']['name']}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
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
                            width: SizeConfig.screenWidth * 0.095,
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
                                MaterialPageRoute(
                                    builder: (context) => my_profile()),
                              );
                            }
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => wishListScreen()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => cart_screen()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => location_list()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
                            child: Image.asset(
                              "assets/images2/file.png",
                            ),
                          ),
                          title: Text(
                            'Additional Details',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => additionalInfo()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => contactUs()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => aboutUs()));
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                                  title: 'Leave a feedback',
                                  // Title of dialog
                                  showTextBox: true,
                                  // default false
                                  textBoxHint:
                                  'Share your feedback',
                                  // Feedback text field hint text default: Tell us more
                                  submitText: 'SUBMIT',
                                  // submit button text default: SUBMIT
                                  onSubmitCallback: (feedback) {
                                    print('$feedback');
                                    applicationRating(feedback['rating'],feedback['feedback']);
                                    // map { rating: 2, feedback: 'some feedback' }
                                    Navigator.pop(context);
                                    Toast.show("Thanks for your feedback", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                  },
                                  askLaterText: 'ASK LATER',
                                  onAskLaterCallback: () {
                                    print('Do something on ask later click');
                                  },
                                );
                              },
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: SizeConfig.screenWidth * 0.095,
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => termsAndConditions()));
                          },
                        ),

                        ListTile(
                          title: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ]
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 5),
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
                          ),
                          onTap: () async {
                            Navigator.pop(context);
                            await signout();
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(child: Container(child: CircularProgressIndicator()));
        }
      ),
    );
  }
}
