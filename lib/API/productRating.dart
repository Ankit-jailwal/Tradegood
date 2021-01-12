import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future productRating(int ratingStars,String review,String productId) async{
  final String url = server + "/api/rating/createProductRating";
  String res= await storage.read(key: 'jwt');
  Map data={
    "product":productId,
    "rating":[{
      "star": ratingStars,
      "review":review
  }]
  };
  print(data);
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