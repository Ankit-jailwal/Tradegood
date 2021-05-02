import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';


Dio dio = new Dio();
Future updateAdditionalDetails(String address,File file,var name,var certificateNumber) async {
  String uploadURL= server+"/api/updateUserAdditionalDetails";
  File compressedFile;
  if(file!=null){
    compressedFile= await FlutterNativeImage.compressImage(file.path, quality: 80,
    );
  }

  String res= await storage.read(key: 'jwt');
  bool hasExpired = JwtDecoder.isExpired(res);
  if(hasExpired==true) {
    String email= await storage.read(key: 'email');
    String password= await storage.read(key: 'password');
    final token = await AuthenticationService().login(email, password);
    final tokenBody=jsonDecode(token);
    storage.write(key: "jwt", value: tokenBody["token"]);
    res=tokenBody["token"];
  }
  String token= "Bearer "+res;
  FormData data = file==null?FormData.fromMap({
  "address":address,
    "certificateNumber":certificateNumber,
  }):FormData.fromMap({
    "address":address,
    "certificateNumber":certificateNumber,
    "certificate": await MultipartFile.fromFile(
      compressedFile.path,
      filename: "Cert-${name}.jpg",
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