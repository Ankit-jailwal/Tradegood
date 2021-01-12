import 'package:flutter/material.dart';
import 'package:tradegood/components/custom_surfix_icon.dart';
import 'package:tradegood/components/form_error.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/svg.dart';
import 'package:tradegood/API/forgotPassword.dart';
import '../../../constants.dart';
import 'package:toast/toast.dart';

class Body extends StatelessWidget {
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
  final TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            controller: emailController,
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
                  errors.remove(kInvalidEmailError);
                });
              } else if (!value.isEmpty &&!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState((){
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          FlatButton(
            onPressed: () async{
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                var res = await forgetPassword(emailController.text);
                if (res['info']!=null)
                  {
                    FocusScope.of(context).unfocus();
                    Toast.show(res['info'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  }
                else
                  {
                    Toast.show(res['error'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                  }
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(211, 1, 90, 207),
                  borderRadius: BorderRadius.circular(10.0),

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
