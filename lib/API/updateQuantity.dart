import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';

Future updateQuantity(int quantity, String id) async {
  final String url = server + "/api/cart/updateCartItems";
  String res = await storage.read(key: 'jwt');
  print("IDDDDDDD $id");
  Map data = {
    "cartItems": {"product": id, "quantity": quantity}
  };
  print(res);
  print(data);
  String token = "Bearer " + res;
  print("token $token");
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json", "Authorization": "$token"},
      body: jsonEncode(data));
  print(response.body);
  final body = response.body;
  final category = jsonDecode(body);
  return category;
}
