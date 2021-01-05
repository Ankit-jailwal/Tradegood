import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:shop_app/API/Auth/authentication.dart';



Future addToCart(String product,int quantity,int price) async{
  final String url = server + "/api/user/cart/addToCart";
  String res= await storage.read(key: 'jwt');
  print(res);
  Map data = {"cartItems":{"product": product, "quantity": quantity, "price":price}};
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
    body: jsonEncode(data)
  );
  print(response.body);
  print(response.statusCode);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}