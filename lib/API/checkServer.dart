import 'package:http/http.dart' as Http;
import 'package:tradegood/API/authentication.dart';



Future checkServer() async{
  final String url = server;
  final response = await Http.get(Uri.parse(url)
  );
  final status=response.statusCode;
  return status;
}