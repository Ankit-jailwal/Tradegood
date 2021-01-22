import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';



Future resetPassword(String password,String OTP) async{
  final String url = server + "/api/resetPassword";
  Map data={
    "password":password,
    "token":OTP
  };
  print(data);
  print("token $token");
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data)
  );
  print(response.body);
  print(response.statusCode);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}