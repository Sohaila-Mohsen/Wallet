import 'package:flutter/material.dart';
import 'package:wallet/sp_helper/cache_helper.dart';
import 'package:wallet/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await Firebase.initializeApp();
  runApp(const AppRoot());
}
