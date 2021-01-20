import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';



Future getOrder() async{
  final String url = server + "/api/order/getOrderItems";
  String res= await storage.read(key: 'jwt');
  bool hasExpired = JwtDecoder.isExpired(res);
  if(hasExpired==true)
  {
    String email= await storage.read(key: 'email');
    String password= await storage.read(key: 'password');
    final token = await AuthenticationService().login(email, password);
    final tokenBody=jsonDecode(token);
    storage.write(key: "jwt", value: tokenBody["token"]);
    res=tokenBody["token"];
  }
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