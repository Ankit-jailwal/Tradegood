import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';
import 'package:tradegood/API/getProductById.dart';



Future placeOrderItem(var cartData,int cartTotal) async{
  final String url = server + "/api/order/addOrderItems";
  String res= await storage.read(key: 'jwt');
  var orderList=[];
for(int i=0; i<cartData['cart']['cartItems'].length ;i++)
  {print(cartData['cart']['cartItems'][i]['_id']);
    var productData=await getProductByID(cartData['cart']['cartItems'][i]['product']);
    print("DATA OF PRODUCT $productData");
    orderList.add({
      "product": productData['product'][0]['_id'],
      "payablePrice":productData['product'][0]['ptr']*(cartData['cart']['cartItems'][i]['quantity']/productData['product'][0]['quantity']),
      "purchasedQuantity":cartData['cart']['cartItems'][i]['quantity'],
    });
  }
print(orderList);
  Map data={
    "totalAmount": cartTotal,
    "orderItems":orderList,
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