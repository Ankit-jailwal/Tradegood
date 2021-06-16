import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future checkOTP(String OTP) async{
  final String url = server + "/api/verifyToken";
  Map data={
    "token":OTP
  };
  final response = await Http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data)
  );
  final body=response.body;
  return jsonDecode(body);
}