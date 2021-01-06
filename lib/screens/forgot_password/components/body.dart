import 'package:flutter/material.dart';
import 'package:tradegood/components/custom_surfix_icon.dart';
import 'package:tradegood/components/form_error.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            width: 411.0,
            height: 731.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images2/Login_forgotpswd_TG.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.asset(
                "assets/images2/Login_forgotpswd_TG.png",
                color: null,
                fit: BoxFit.cover,
                width: 411.0,
                height: 731.0,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.18),
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

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                print("hello");
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(211, 1, 90, 207),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(63, 0, 0, 0),
                      offset: Offset(0.0, 4.0),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '''Get password''',
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
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, SignInScreen.routeName);
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
