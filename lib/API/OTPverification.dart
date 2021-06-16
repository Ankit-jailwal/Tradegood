import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future OTPverification(String phone) async{
  final String url = server + "/api/sendSignupToken";
  Map data={
    "phoneNumber":phone
  };
  final response = await Http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data)
  );
  final body=response.body;
  return jsonDecode(body);
}