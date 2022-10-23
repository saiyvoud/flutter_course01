// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cours01/controller/main_controller.dart';
import 'package:flutter_cours01/pages/auth/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.lazyPut<MainController>(() => MainController());

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "flutter course 01",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.yellow),
      home: LoginPage(),
    );
  }
}
