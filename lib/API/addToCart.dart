import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:shop_app/API/Auth/authentication.dart';



Future getWishlist() async{
  final String url = server + "/api/wishlist/getWishlist";
  String res= await storage.read(key: 'jwt');
  print(res);
  //Map<String, String> data = {"email": email, "password": password};
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