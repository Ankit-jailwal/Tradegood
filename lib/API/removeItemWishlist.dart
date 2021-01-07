import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'file:///C:/Users/jailw/Downloads/Tradegood-frontend/Tradegood-frontend/lib/API/authentication.dart';



Future removeItemWishlist(String id) async{
  final String url = server + "/api/wishlist/deleteWishlistItems";
  String res= await storage.read(key: 'jwt');
  print(res);
  Map data={
    "wishlistItems":{
      "product": "5ff6240ed008fc65fdccf0d6"
    }
  };
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
    body: data
  );
  print(response.body);
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}