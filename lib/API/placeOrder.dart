import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future placeOrderItem(var orderData) async{
  final String url = server + "/api/cart/deleteCartItems";
  String res= await storage.read(key: 'jwt');
for(int i=0; i<orderData['cart']['cartItems'].length ;i++)
  {

  }
  Map data={
    "totalAmount": 50000,
    "orderItems":[
      {
        "product": "id",
        "payablePrice":"5000",
        "purchasedQuantity":10,
      },
    ],
    "paymentStatus":"pending",
    "orderStatus": [
      {
        "type": "ordered",
        "isCompleted": true
      },
    ]
  };
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