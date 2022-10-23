// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cours01/controller/main_controller.dart';
import 'package:flutter_cours01/pages/auth/register.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _fromKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                "assets/Enter OTP-bro.png",
                height: 200,
              ),
              Text(
                "Login to your account",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "phone", prefixIcon: Icon(Icons.call)),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "Phone is require";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: "password", prefixIcon: Icon(Icons.key)),
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "Password is require";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 160,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        controller.login(phone.text, password.text, context);
                      }
                    },
                    child: Text("Login")),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 160,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Register")),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
