import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:shop_app/API/Auth/authentication.dart';



Future getProductByID(String ID) async{
  final String url = server + "/api/product/getProductById";
  String res= await storage.read(key: 'jwt');
  print(res);
  Map data={"product":ID};
  String token= "Bearer "+res;
  print("token $token");
  final response = await Http.post(url,
    headers: {"Content-Type": "application/json","Authorization":"$token"},
    body: jsonEncode(data)
  );
  print("Product Details ${response.body}");
  final body=response.body;
  final category=jsonDecode(body);
  return category;
}