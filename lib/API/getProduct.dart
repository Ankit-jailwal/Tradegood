import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


Future getProduct(String productUrl) async{
  final String url = server + "/api/product$productUrl";
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
  final response = await Http.get(Uri.parse(url),
    headers: {"Content-Type": "application/json","Authorization":"$token"},
  );
  final body=response.body;
  return jsonDecode(body);
}