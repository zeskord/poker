import 'dart:io';
import 'dart:convert';
import 'package:poker/config.dart';
import 'package:poker/localstorage.dart';

class UserData {
  bool isAuthentificated = false;
  String username = '';
  bool isSpectator = false;

  UserData() {
    _readFromStorage();
  }
  // UserData(this.isAuthentificated, this.username, this.isSpectator);

  void _readFromStorage() async {
    String? _userDataFromStorage = await storageGetValue('userdata');
    if (_userDataFromStorage == null) {
      // Перенаправить пользователя на страницу логина.

    } else {
      Map<String, dynamic> _json = jsonDecode(_userDataFromStorage);
      username = _json['username'];
      isSpectator = _json['isSpectator'];
    }
  }
}

Future<String> signIn(String username, bool isSpectator) async {
  // var response = await http.get("http://zeskord.ru")

  HttpClient client = HttpClient();
  // client
  //     .getUrl(Uri.parse('http://zeskord.ru/api/login'))
  //     .then((HttpClientRequest request) {
  //   // Optionally set up headers...
  //   // Optionally write to the request object...
  //   // Then call close.
  //   return request.close();
  // }).then((HttpClientResponse response) {
  //   // Process the response.
  // });

  // HttpClientRequest request = await client.post(
  //     'http://zeskord.ru/', HttpClient.defaultHttpPort, '/api/login');

  HttpClientRequest request =
      await client.postUrl(Uri.parse('${baseUrl()}/api/login'));
  request.headers.contentType =
      ContentType("application", "json", charset: "utf-8");
  UserID userId = UserID(username, isSpectator);
  request.headers.set("userdata", userHeader(userId));
  request.write(userId);
  HttpClientResponse response = await request.close();
  String str = response.toString();

  return str;
}

String userHeader(UserID userId) {
  return jsonEncode(userId);
}

class UserID {
  final String username;
  final bool isSpectator;

  UserID(this.username, this.isSpectator);
}
