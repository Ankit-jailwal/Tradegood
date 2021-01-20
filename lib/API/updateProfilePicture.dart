import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tradegood/API/authentication.dart';


Dio dio = new Dio();
Future updateProfilePicture(File file) async {
    String uploadURL= server+"/api/updateUserProfilePicture";
    String fileName = file.path.split('/').last;
    print(fileName);
    File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: 80,
        targetWidth: 300, targetHeight: 300);
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
      "profilePicture": await MultipartFile.fromFile(
        compressedFile.path,
        filename: "fileName"
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
    print(jsonResponse);
  }