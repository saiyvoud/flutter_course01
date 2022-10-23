// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cours01/controller/main_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final comfirm = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Enter OTP-bro.png",
                height: 200,
              ),
              Text(
                "Create to your account",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: firstName,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "firstName", prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "firstName is require";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastName,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "lastName", prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "lastName is require";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "phone", prefixIcon: Icon(Icons.call)),
                validator: (value) {
                  if (value!.isEmpty) {
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
                  if (value!.isEmpty) {
                    return "Password is require";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: comfirm,
                decoration: InputDecoration(
                    hintText: "comfirm password", prefixIcon: Icon(Icons.key)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "comfirm password is require";
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
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        controller.register(firstName.text, lastName.text,
                            phone.text, password, context);
                      }
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
