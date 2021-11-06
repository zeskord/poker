import 'package:shared_preferences/shared_preferences.dart';

void storageSetValue(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // int counter = (prefs.getInt('counter') ?? 0) + 1;
  // print('Pressed $counter times.');
  await prefs.setString(key, value);
}

Future<String?> storageGetValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? _value = prefs.getString('counter');
  return _value;
}

Future<bool> storageDeleteValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _res = await prefs.remove(key);
  return _res;
}
