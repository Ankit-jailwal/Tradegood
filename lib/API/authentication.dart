import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';


const Map Server = {"host": "https://app.tradegood.in", "port": "443"};
String getServerURI() => Server["host"] + ':' + Server["port"];

final storage = FlutterSecureStorage();
final token = storage.read(key: "jwt");
final server = getServerURI();
class AuthenticationService {
  static AuthenticationService _singleton;

  final FlutterSecureStorage _secureStorage = new FlutterSecureStorage();
  final _storageBaseKey = 'auth-data';
  final _authTokenStorageKey = 'jwtToken';


  bool initTokenSet = false;
  String _authToken;

  AuthenticationService._() {
    _secureStorage.read(key: generatekey(_authTokenStorageKey)).then((token) {
      initTokenSet = true;
      _setAuthToken(token);
    });
  }

  factory AuthenticationService() {
    if (_singleton == null) {
      _singleton = AuthenticationService._();
    }
    return _singleton;
  }

  String generatekey(String key) => _storageBaseKey + '/' + key;

//Logout function(deletes token from storage)

//TOKEN

  Future login(String phone, String password) async {
    final String url = server + "/api/signin";

    Map<String, String> data = {"phoneNumber": phone, "password": password};

    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));

    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _setAuthToken(body["token"]);
      return response.body;
    }
    else
      return response.body;
  }

  Future<void> _setAuthToken(String token) {
    _authToken = token;
    return _secureStorage.write(
        key: generatekey(_authTokenStorageKey), value: token);
  }

  Future<void> logout() {
    return _setAuthToken(null);
  }

  bool get authenticationStatus {
    while (!initTokenSet);
    return _authToken != null;
  }
  String get authenticationToken => _authToken;
}






class ConnectionStatusSingleton {
  static final ConnectionStatusSingleton _singleton = new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton getInstance() => _singleton;

  bool hasConnection = false;

  StreamController connectionChangeController = new StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch(_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}

Future attemptSignUp(String fullname, String phno, String email, String password) async {
  final String url = server + "/api/signup";

  Map<String, String> data = {"name": fullname, "phoneNumber": phno, "email": email, "password": password};

  final response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data));

  return response.body;
}