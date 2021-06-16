import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';
import 'package:intl/intl.dart';




Future placeOrderItem(var cartData,int cartTotal,var time,var deliveryCharge) async{
  final String url = server + "/api/order/addOrderItems";
  String res= await storage.read(key: 'jwt');
  bool hasExpired = JwtDecoder.isExpired(res);
  if(hasExpired==true)
  {
    String email= await storage.read(key: 'email');
    String password= await storage.read(key: 'password');
    final token = await AuthenticationService().login(email, password);
    final tokenBody=jsonDecode(token);
    storage.write(key: "jwt", value: tokenBody["token"]);
    res=tokenBody["token"];
  }
  var orderList=[];
for(int i=0; i<cartData['cart']['cartItems'].length ;i++)
  {orderList.add({
      "product": cartData['cart']['cartItems'][i]['product']['_id'],
      "payablePrice":cartData['cart']['cartItems'][i]['product']['ptr']*(cartData['cart']['cartItems'][i]['quantity']),
      "purchasedQuantity":cartData['cart']['cartItems'][i]['quantity'],
    });
  }
  var parsedDate = DateTime.parse(time);

  DateFormat('EEEE').format(parsedDate);
  DateFormat('yyyy-MM-dd').format(parsedDate);
  Map data={
    "totalAmount": cartTotal,
    "orderItems":orderList,
    "paymentStatus":"pending",
    "orderDeliveryDay":DateFormat('EEEE').format(parsedDate),
    "orderDeliveryDate":DateFormat('yyyy-MM-dd').format(parsedDate),
    "orderDeliveryCharge":deliveryCharge,
    "orderStatus": [
      {
        "type": "ordered",
        "isCompleted": true
      },
    ]
  };
  String token= "Bearer "+res;
  final response = await Http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      body: jsonEncode(data)
  );
  final body=response.body;
  return jsonDecode(body);
}