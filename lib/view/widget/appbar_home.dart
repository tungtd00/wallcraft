import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../model/users.dart';
import '../../provider/auth_provider.dart';
import '../account/detailUser.dart';
import '../account/login.dart';
class AppBarHome extends StatefulWidget implements PreferredSizeWidget{
  const AppBarHome({Key? key}) : super(key: key);
  @override
  State<AppBarHome> createState() => _AppBarHomeState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight) ;
}
class _AppBarHomeState extends State<AppBarHome> {
  // bool checkInit = false;
  User? user = null;
  // late Future<void> _myFuture;
  @override
  initState()   {
    super.initState();
    print("initState buil lại");
    // checkInit = true;
    // _myFuture =  _getUserFromSharedPreferences();
  }
  Future<void> _saveUserToSharedPreferences(User? user)async {
    print("tiến hành lưu trạng thái đăng nhập");
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user?.toJson());
    print("encode user  :${userJson.toString()} " );
    await prefs.setString('user', userJson);
  }
  Future<User?> _getUserFromSharedPreferences()async{
    print("getusser");
    final prefs = await SharedPreferences.getInstance();
    final userJson =  prefs.getString('user');
    print(userJson.toString());
    if(userJson != null){
      final userMap = jsonDecode(userJson);
      print("userMap để from ra json  : ${userMap.toString()}");
      return User.fromJson(userMap);
    }
    else{
      print("userMap là null");
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    int index = context.watch<changePage>().IndexPage;
    user = context.watch<AuthProvider>().user;
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        user != null
            ? Container(
            alignment: Alignment.center,
            child: Text(
              "${user?.name}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ))
            : Container(),
               index == 0
            ? IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              if (user != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailUser(),
                        settings: RouteSettings(arguments: user)));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()));
              }
            },
            icon: Icon(Icons.account_circle))
            : Container(),
      ],
      title: Text(titlePage[context.watch<changePage>().IndexPage]),
    );

  //     FutureBuilder(
  //     // future:_myFuture,
  //     //   builder: (context,snapshot){
  //     // if(snapshot.connectionState == ConnectionState.done){
  //       User? u =User();
  //       if(snapshot.data != 0){
  //         u = snapshot.data as User?;
  //       }
  //       else{
  //         u = null;
  //       }
  //       print("object ${u?.name}");
  //       if(checkInit){
  //         user = u;
  //         print("check init");
  //         checkInit = false;
  //       }
  //       else{
  //         user = context.watch<AuthProvider>().user;
  //         print("user lấy từ provider  : ${user.toString()}");
  //         _saveUserToSharedPreferences(user);
  //       }
  //
  //       int index = context.watch<changePage>().IndexPage;
  //       print("buil tiếp");
  //
  //   // }
  //   // else{
  //   // print("chưa thuch hiện xong hàm chờ");
  //   // return CircularProgressIndicator();
  //   // }
  //
  // // },
  //   );
  }

}
