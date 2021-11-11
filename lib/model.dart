// Здесь описываются данные и манипуляции с ними.

// import 'dart:io';
import 'package:dio/dio.dart';

import 'dart:convert';
// import 'package:http/http.dart';
import 'config.dart';

class UserList {
  final List<UserItem> users = [];
  UserList() {
    // getFromApi();
  }

  void getFromApi() async {
    String address = 'https://jsonplaceholder.typicode.com/users/';
    Response response = await Dio().get(address);
    List<dynamic> data = response.data;
    // String str = response.toString();
    // Map<String, dynamic> user = jsonDecode(str);
    data.forEach((element) {
      users.add(UserItem(username: element['name']));
    });
  }
}

class UserItem {
  final String username;
  final bool isSpectator = false;

  UserItem({required this.username});
}
