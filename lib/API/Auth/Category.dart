import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:shop_app/API/Auth/authentication.dart';



Future get_category(String type) async{
  print("data");
  final String url = server + "/api/$type";
  print("data");
String res= await storage.read(key: 'jwt');
  print("data");
  print(res);
String token= "Bearer "+res;
print("token $token");
  print("data");
  final response = await Http.get(url,
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      );
  print("data");
  print(response.body);
  final body=response.body;
  print("data");
  final category=jsonDecode(body);
  return category;
}