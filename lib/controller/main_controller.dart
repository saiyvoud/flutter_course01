// ignore_for_file: unused_import, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter_cours01/config/config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../widget/alert.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final box = GetStorage();

  register(firstName, lastName, phone, password, context) async {
    try {
      var body = {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
      };
      var url = Uri.parse("${END_POINT}/user/register");
      print(url);
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data["msg"] == "phone is already") {
          showDialogBoxFaild("phon is already", context);
        } else {
          await setToken(data["token"]);
          showDialogBoxSuccess("Register Succesful", context);
        }
      }
    } catch (e) {
      showDialogBoxFaild("register error", context);
    }
  }

  login(phone, password, context) async {
    try {
      var body = {
        "phone": phone,
        "password": password,
      };
      print(body);
      var url = Uri.parse("${END_POINT}/user/login");

      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        print(response.body);
        var data = jsonDecode(response.body);

        if (data["msg"] == "Invalid phone password") {
          showDialogBoxFaild("Invalid phone password", context);
          update();
        } else {
          await setToken(data["token"]);
          showDialogBoxSuccess("Login Succesful", context);
          update();
        }
      } else {
        print(response.body);
        showDialogBoxFaild("login error", context);
        update();
      }
    } catch (e) {
      showDialogBoxFaild("login error", context);
    }
  }

  setToken(token) async {
    await box.write("token", token);
  }

  logout() async {
    await box.remove("token");
  }
}
