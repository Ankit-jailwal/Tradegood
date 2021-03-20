import 'package:flutter/material.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'components/body.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/checkServer.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool psuedoFlag=true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivity, Widget child) {
                final bool connected = connectivity != ConnectivityResult.none;
                return !connected
                    ? noInternet()
                    : FutureBuilder(
                        future: checkServer(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!=200?Center(
                              child: Container(
                                width: SizeConfig.screenWidth*0.9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: Image.asset('assets/images/serverError.jpg')),
                                    SizedBox(height: 30,),
                                    FlatButton(
                                      onPressed: (){
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
                                      },
                                      child: Container(
                                        height: 40,width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Center(child: Text("Retry",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ):Body();
                          }
                          return Center(child: CircularProgressIndicator());
                        });
              },
              child: Container());
        },
      ),
    );
  }
}
