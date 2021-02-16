import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

const kPrimaryColor = Color(0xFF025ACF);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kQuantityNullError = "Please Enter quantity";
const String kQuantityError = "Please enter in multiple of min. quantity";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
String aboutUs='''TradeGood is a Business-to-Business (B2B) e-commerce platform, connecting retailers to known brands, new brands. And most importantly local Made in India brands which are struggling to get exposure in the Marketplace. This a single platform on which retailers can source merchandise from manufacturers as well as distributors.

Well all are aware how much it is difficult to get a exposure to new made in India brands. As it is a high time its important to support Made in India local business and to provide them with exposure in the marketplace.E platform gives them access to buy on their terms with hassle free logistics.Discovering products &suppliers across multiple categories.Access to new brands ,manufacturers and marketing,sales support to retailers for business.TradeGood provides access to low cost & Reliable delivery system.TradeGood allows direct connection between distributors and retailers which allow conversations in real time.''';