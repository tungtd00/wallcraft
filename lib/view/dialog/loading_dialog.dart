import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
              child: Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        msg,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog());
  }
}
