import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:shop_app/API/Auth/authentication.dart';



Future getStaticOffer() async{
  final String url = server + "/api/offer/getUserStaticOffer";
  String res= await storage.read(key: 'jwt');
  print(res);
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.get(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
  );
  print("STATIC STATIC STATIC ${response.body}");
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}