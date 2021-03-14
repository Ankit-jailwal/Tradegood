import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradegood/components/form_error.dart';
import 'package:tradegood/API/authentication.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/otp/otp_screen.dart';
import 'package:tradegood/screens/sign_in/sign_in_screen.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/screens/termsAndConditions/components/Body.dart';

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
  final TextEditingController GSTcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
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
    return Column(
      children: [
        Container(
            height: SizeConfig.screenHeight * 0.08,
            child: buildFullNameFormField()),
        SizedBox(height: getProportionateScreenHeight(20)),
        Container(
            height: SizeConfig.screenHeight * 0.08,
            child: buildPhoneFormField()),
        SizedBox(height: getProportionateScreenHeight(20)),
        Container(
            height: SizeConfig.screenHeight * 0.08,
            child: buildEmailFormField()),
        SizedBox(height: getProportionateScreenHeight(20)),
        Container(
            height: SizeConfig.screenHeight * 0.08,
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
    Flexible(
      child: RichText(
      text: TextSpan(
      children: <TextSpan>[
      TextSpan(text: 'By clicking create account, you agree to our ',style: TextStyle(color: Colors.black45)),
      TextSpan(
      text: 'Terms and conditions.',style: TextStyle(color: Colors.blue),
        recognizer: new TapGestureRecognizer()..onTap = () =>  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Scaffold(
              body: Body())),
        )),
      ],
      ),
      ),
    )
          ],
        ),
        FlatButton(
          onPressed: () async {

           final fullname = fullnamecontroller.text;
           final phno = phnocontroller.text;
           final email = emailcontroller.text;
           final password = passwordcontroller.text;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => OtpScreen(fullname,phno,email,password)),
          // );
           var body;
           if(remember==true)
           {
             body=await attemptSignUp(fullname, phno, email, password);
             print(body);
             final decodeBody = jsonDecode(body);
             if (decodeBody["message"] == "Verification token has been sent to your mobile") {
               //Toast.show(decodeBody['errors'], context, duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => OtpScreen(fullname,phno,email,password)),
                 );
             }
             else{
               if (decodeBody["message"] == "User already registered")
                 displayDialog(context, decodeBody["message"], "Please try to sign up using another phone number or login if you already have an account.");
               if(decodeBody['errors']!=null)
                 Toast.show(decodeBody['errors'], context, duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
               if(decodeBody['error']!=null)
                 Toast.show("Something went wrong!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
             }
           }
           else
             Toast.show("Please agree Terms and Conditions", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
        },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 150.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(211, 1, 90, 207),
                borderRadius: BorderRadius.circular(10.0),
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.visibility),
        )
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: _isHidden,
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
        labelText: "Password*",
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.mail),
        )
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
        labelText: "Full Name*",
        hintText: "Enter your Full Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.drive_file_rename_outline),
        )
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: addresscontroller,
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
          labelText: "Address*",
          hintText: "Enter your Address",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.my_location_outlined),
          )
      ),
    );
  }

  TextFormField buildGSTFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: GSTcontroller,
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
          labelText: "GST Number*",
          hintText: "Enter your GST Number",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.article_outlined),
          )
      ),
    );
  }

  TextFormField buildPhoneFormField() {
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
        labelText: "Phone No*",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.phone),
        )
      ),
    );
  }
}
