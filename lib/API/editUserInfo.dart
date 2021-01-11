import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future editUserInfo(String name,String ph) async{
  final String url = server + "/api/updateUserInfo";
  String res= await storage.read(key: 'jwt');
Map data={"name":name,"phoneNumber":ph};
  print(res);
  print(data);
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
    body:jsonEncode(data)
  );
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}