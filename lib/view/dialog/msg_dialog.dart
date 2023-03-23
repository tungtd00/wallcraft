import 'package:flutter/material.dart';
import 'package:wallcraft/view/account/login.dart';

class MsgDialog {
  static showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
      barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: TextButton(

                    style: TextButton.styleFrom(
                      textStyle: TextStyle(color: Colors.black),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      disabledBackgroundColor: Colors.white,
                    ),
                      child: Text("OK",style: TextStyle(color: Colors.black),),
                      onPressed: () {
                        Navigator.of(context).pop(MsgDialog());
                      }),
                )
              ],
            ));
  }
  static showDialogLogin(BuildContext context){
    showDialog(
        barrierDismissible: true,
        context: context,

        builder:(context) => AlertDialog(
            title: Text("Đăng nhập"),
            content: Text("Đăng nhập để sử dụng tính năng này"),
          actions: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  TextButton(

                  style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.black),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  disabledBackgroundColor: Colors.white,
                  ),
                  child: Text("Hủy",style: TextStyle(color: Colors.black),),
                  onPressed: () {
                  Navigator.of(context).pop(MsgDialog());
                }),
                TextButton(

                    style: TextButton.styleFrom(
                      textStyle: TextStyle(color: Colors.black),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      disabledBackgroundColor: Colors.white,
                    ),
                    child: Text("OK",style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    }),


              ],
            )
          ],

        )
    );
  }
}
