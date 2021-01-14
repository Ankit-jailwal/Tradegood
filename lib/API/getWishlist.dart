import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future getWishlist() async{
  final String url = server + "/api/wishlist/getWishlist";
  String res= await storage.read(key: 'jwt');
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