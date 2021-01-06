import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tradegood/components/custom_surfix_icon.dart';
import 'package:tradegood/components/form_error.dart';
import 'package:tradegood/API/authentication.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

void displayDialog(context, title, text) => showDialog(
  context: context,
  builder: (context) =>
      AlertDialog(
          title: Text(title),
          content: Text(text)
      ),
);

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String fullname;
  String phno;
  String email;
  String password;
  String conform_password;
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController phnocontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
              height: SizeConfig.screenHeight * 0.07,
              child: buildFullNameFormField()),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              height: SizeConfig.screenHeight * 0.07,
              child: buildPhnoFormField()),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              height: SizeConfig.screenHeight * 0.07,
              child: buildEmailFormField()),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              height: SizeConfig.screenHeight * 0.07,
              child: buildPasswordFormField()),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("I read and agree to Terms and Conditions"),
            ],
          ),

          FlatButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                final fullname = fullnamecontroller.text;
                final phno = phnocontroller.text;
                final email = emailcontroller.text;
                final password = passwordcontroller.text;
                final body =
                    await attemptSignUp(fullname, phno, email, password);
                final decode_body = jsonDecode(body);
                if(decode_body["message"] == "User created successfully")
                {
                  displayDialog(context, "Success", "The user was created. Log in now.");
                }
                //print(decode_body["message"]);
                else if(decode_body["message"] == "User already registered")
                  displayDialog(context, "That username is already registered", "Please try to sign up using another username or log in if you already have an account.");
                else {
                  displayDialog(context, "Error", "An unknown error occurred.");
                }
                // if all are valid then go to success screen
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
                    '''Create Account''',
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

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordcontroller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailcontroller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
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
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: fullnamecontroller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your Full Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPhnoFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: phnocontroller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mobile No",
        hintText: "Enter your Phone Number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }
}
