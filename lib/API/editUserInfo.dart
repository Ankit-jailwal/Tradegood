import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/API/authentication.dart';



Future editUserInfo(String name,String ph) async{
  final String url = server + "/api/updateUserInfo";
  String res= await storage.read(key: 'jwt');
  print("name:$name");
Map data={"name":name,"phoneNumber":ph};
  print(res);
  print(data);
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
    headers: {"Authorization":"$token"},
    body:data
  );
  print(response.body);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}