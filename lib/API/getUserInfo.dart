import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/API/authentication.dart';



Future getUserInfo() async{
  final String url = server + "/api/getUserInfo";
  String res= await storage.read(key: 'jwt');

  print(res);
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.get(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
  );
  print(response.body);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}