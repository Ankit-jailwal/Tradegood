import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future checkServer() async{
  final String url = server;
  final response = await Http.get(url
  );
  print(response.body);
  print(response.statusCode);
  final status=response.statusCode;
  return status;
}