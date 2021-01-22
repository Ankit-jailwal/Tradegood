import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tradegood/components/custom_surfix_icon.dart';
import 'package:tradegood/components/form_error.dart';
import 'package:tradegood/API/authentication.dart';
import 'package:tradegood/screens/forgot_password/forgot_password_screen.dart';
import 'package:tradegood/screens/home/home_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String phone;
  String password;
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  bool _isHidden = true;
  bool rememberMe = false;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          FlatButton(
            onPressed: () async {
                final phone=phonecontroller.text;
                final password=passwordcontroller.text;
                final _token = await AuthenticationService()
                    .login(phone, password);
                final token_body = jsonDecode(_token);
                if(token_body["token"] != null) {
                  storage.write(key: "jwt", value: token_body["token"]);
                  storage.write(key: "email", value: phone);
                  storage.write(key: "password", value: password);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen("Categories","/category/getCategory",false)
                      )
                  );
                } else {
                  if(token_body["errors"]!=null)
                    addError(error: token_body["errors"]);
                  else
                    addError(error: token_body["message"]);
                }
                print(_token);

            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(211, 1, 90, 207),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '''Login''',
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
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordcontroller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: _isHidden,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: _toggleVisibility,
            child: _isHidden
                ? Icon(Icons.visibility_off,size: 30,)
                : Icon(Icons.visibility,size: 30,),
          ),
        )
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: phonecontroller,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right:20),
          child: Icon(Icons.mail,size: 30,),
        ),
      ),
    );
  }
}
