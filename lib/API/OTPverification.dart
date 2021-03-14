import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future OTPverification(String phone) async{
  final String url = server + "/api/sendSignupToken";
  Map data={
    "phoneNumber":phone
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