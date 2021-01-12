import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future forgetPassword(String email) async{
  final String url = server + "/api/forgetPassword";
  String res= await storage.read(key: 'jwt');
  Map data={
    "email":email
  };
  print(data);
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      body: jsonEncode(data)
  );
  print(response.body);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}