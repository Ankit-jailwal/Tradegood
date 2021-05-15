import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';
import 'package:intl/intl.dart';



Future editDeliveryDate(DateTime editedDate) async{
  final String url = server + "/api/updateUserCustomDeliveryDate";
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
  Map data={
    "customDeliveryDate": DateFormat('MM-dd-yy').format(editedDate,).toString(),
    "deliveryDay":DateFormat('EEEE').format(editedDate,).toString()
  };
  String token= "Bearer "+res;
  final response = await Http.post(url,
      headers: {"Content-Type": "application/json","Authorization":"$token"},
      body:jsonEncode(data)
  );
  final body=response.body;
  return jsonDecode(body);
}