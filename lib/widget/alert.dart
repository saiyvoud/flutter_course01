// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

showDialogBoxFaild(String txt, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            Icons.error,
            color: Colors.red,
            size: 18,
          ),
          content: Text(
            txt,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  Get.back();
                },
                child: Text("cancel"))
          ],
        );
      });
}

showDialogBoxSuccess(String txt, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            Icons.check,
            color: Colors.green,
            size: 18,
          ),
          content: Text(
            txt,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ],
        );
      });
}
