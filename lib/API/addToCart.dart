import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';

Future addToCart(String product,int quantity) async{
  final String url = server + "/api/cart/addItemsToCart";
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
  Map data = {"cartItems":{"product": product, "quantity": quantity}};
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