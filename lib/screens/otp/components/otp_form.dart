import 'package:flutter/material.dart';
import 'package:tradegood/components/default_button.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/API/checkOTP.dart';
import 'package:tradegood/API/OTPverification.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


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
class OtpForm extends StatefulWidget {
  String phone;
  OtpForm(this.phone);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  final TextEditingController OTPcontroller = TextEditingController();
    var currentText;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.13),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              activeColor: Colors.blue,
              fieldHeight: 50,
              fieldWidth: 40,
              selectedFillColor: Colors.white,
              inactiveColor: Colors.blue,
              inactiveFillColor: Colors.white,
              activeFillColor: Colors.white,
            ),
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            controller: OTPcontroller,
            onCompleted: (v) {
            },
            onChanged: (value) {
              setState(() {
                currentText = value;
              });
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async{
              var response=await checkOTP(OTPcontroller.text);
              if(response['Valid']==true){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              }
              else
                {
                  Toast.show("Please enter valid OTP", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          FlatButton(
            onPressed: () async{
             await OTPverification(widget.phone);

             Toast.show("OTP successfully sent to ${widget.phone}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
            },
            child: Text(
              "Resend OTP",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
