import 'package:flutter/material.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/svg.dart';
import 'package:tradegood/API/resetPasswordOTP.dart';
import 'package:tradegood/API/resetPassword.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  //"assets/images2/signIn.png",
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Image.asset("assets/images2/signIn.png",fit: BoxFit.fill,),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  Container(
                      width: SizeConfig.screenWidth*0.6,
                      child: Image.asset("assets/images2/tgood_black.png")),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    '''Reset Password''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 22.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 73, 73, 73),
                      /* letterSpacing: 0.0, */
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Transform(
                      transform: Matrix4(
                          1.00,
                          0.00,
                          0.00,
                          0.00,
                          -0.00,
                          1.00,
                          0.00,
                          0.00,
                          0.00,
                          0.00,
                          1.00,
                          0.00,
                          0.00,
                          0.00,
                          0.00,
                          1.00),
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 40.0,
                        height: 2.0,
                        child: SvgWidget(painters: [
                          SvgPathPainter.stroke(
                            2.0,
                            strokeMiterLimit: null,
                            strokeCap: null,
                            strokeJoin: StrokeJoin.miter,
                          )
                            ..addPath('M0 0L40 0L40 -2L0 -2L0 0Z')
                            ..color = Color.fromARGB(255, 255, 212, 37),
                        ]),
                      )),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  ForgotPassForm(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
void displayDialog(context, title, text) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: [
      FlatButton(
        child: Text("Sign In"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInScreen()));
        },
      )
    ],
  ),
);
class ForgotPassForm extends StatefulWidget {

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  bool resetFlag=false;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController password1Controller=TextEditingController();
  final TextEditingController password2Controller=TextEditingController();
  final TextEditingController OTPcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          resetFlag?Container():TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: TextInputType.number,
            onSaved: (newValue) => email = newValue,
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(Icons.phone,size: 30,),
              ),
            ),
          ),
          resetFlag?SizedBox(height: getProportionateScreenHeight(15)):Container(),
          resetFlag?TextFormField(
            controller: password1Controller,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(Icons.security,size: 30,),
              ),
            ),
          ):Container(),
          resetFlag?SizedBox(height: getProportionateScreenHeight(15)):Container(),
          resetFlag?TextFormField(
            controller: password2Controller,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(Icons.security,size: 30,),
              ),
            ),
          ):Container(),
          resetFlag?SizedBox(height: getProportionateScreenHeight(15)):Container(),
          resetFlag?TextFormField(
            keyboardType: TextInputType.number,
            controller: OTPcontroller,
            obscureText: false,
            decoration: InputDecoration(
              labelText: "OTP",
              hintText: "Enter OTP",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(Icons.phone_android,size: 30,),
              ),
            ),
          ):Container(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          FlatButton(
            onPressed: () async{
              if(resetFlag==false)
                {
                  var response=await resetPasswordOTP(phoneController.text);
                  if(response['message']=="Reset password token has been sent to your mobile"){
                    setState(() {
                      resetFlag=true;
                    });
                    Toast.show(response['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  }
                  else
                    {
                      Toast.show(response['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                    }
                  //var res = await forgetPassword(phoneController.text);
                  //if (res['info']!=null)
                  //{
                  //  FocusScope.of(context).unfocus();
                  //  Toast.show(res['info'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  //}
                  //else
                  //{
                  //  Toast.show(res['error'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  //}
                }
              else{
                if(password1Controller.text==password2Controller.text) {
                  var response=await resetPassword(password1Controller.text, OTPcontroller.text);
                  if(response['Valid']==true)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    }
                  else if(response['message']!=null)
                    Toast.show(response['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  else if(response['Valid']==false)
                    Toast.show("Enter valid OTP", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  else
                    {
                      if(response['errors']!=null)
                        Toast.show(response['errors'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                      if(response['error']!=null)
                         Toast.show(response['error'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                    }
                }
                else
                  Toast.show("Password does not match", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
              }

            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: resetFlag?160:150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(211, 1, 90, 207),
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: Center(
                  child: Text(
                    resetFlag?"Reset password":"Send OTP",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255),
                      /* letterSpacing: 0.0, */
                    ),
                  ),
                ),
              ),
            ),
          ),
          resetFlag?SizedBox(height: SizeConfig.screenHeight * 0.02):Container(),
          resetFlag?FlatButton(
            onPressed: () async{
              var response=await resetPasswordOTP(phoneController.text);
              print(response);
              Toast.show(response['message'], context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
            },
            child: Text(
              "Resend OTP",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
            ),
          ):Container(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          GestureDetector(
            onTap: (){
              //Navigator.pushNamed(context, SignInScreen.routeName);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_back,
                  color: Colors.indigoAccent,
                  size: 30,),
                  Text("Go back to Sign in page",
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 73, 73, 73),
                      /* letterSpacing: 0.0, */
                    ),
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
