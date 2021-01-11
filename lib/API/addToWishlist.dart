import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future addToWishlist(String product) async{
  final String url = server + "/api/wishlist/addItemToWishlist";
  String res= await storage.read(key: 'jwt');
  Map data = {"wishlistItems":{"product": product}};
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      body: jsonEncode(data)
  );
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}