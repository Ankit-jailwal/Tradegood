import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';

Future getRoutes() async{
  final String url = server + "/api/routing/getRoute";
  String res= await storage.read(key: 'jwt');
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.get(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
  );
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}