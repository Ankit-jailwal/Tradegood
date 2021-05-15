import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';



Future resetPasswordOTP(String phone) async{
  final String url = server + "/api/sendResetPasswordToken";
  Map data={
    "phoneNumber": phone
  };
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data)
  );
  final body=response.body;
  return jsonDecode(body);
}