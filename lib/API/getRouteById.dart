import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';
import 'package:tradegood/API/getUserInfo.dart';


Future getRouteById() async{
  final String url = server + "/api/routing/getRouteById";
  String res= await storage.read(key: 'jwt');
  final userData=await getUserInfo();
  Map data={"route":userData['user']['route']};
  String token= "Bearer "+res;
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      body:jsonEncode(data)
  );
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}