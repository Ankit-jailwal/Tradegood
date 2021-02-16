import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';


Dio dio = new Dio();
Future updateAdditionalDetails(String address,File file) async {
  String uploadURL= server+"/api/updateUserAdditionalDetails";
  String fileName = file.path.split('/').last;
  print(fileName);
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
  String token= "Bearer "+res;
  FormData data = FormData.fromMap({
  "address":address,
    "certificate": await MultipartFile.fromFile(
        file.path,
        filename: "fileName",
    ),
  });
  var jsonResponse;
  await dio.post(uploadURL, data: data,options: Options(
    headers: {
      "Authorization":"$token"
    },
  ),).then((response) {
    jsonResponse = jsonDecode(response.toString());
  }).catchError((error) => print(error));
  return jsonResponse;
}