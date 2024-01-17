import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotemaker/Core/utils/app_strings.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.black,textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
                  child: const Text("Ok"),
                ),
              ],
            ));
  }
}
