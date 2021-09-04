import 'package:appentus/Utils/current_user.dart';
import 'package:appentus/imports.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final userName = pref.getString("name");
  final userImageUrl = pref.getString("image");
  if (userName != null && userImageUrl != null && userImageUrl != 'null') {
    name = userName;
    imagePath = userImageUrl;
  }
  runApp(MyApp());
}
