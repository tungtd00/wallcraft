import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/DrawerMenu.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/provider/auth_provider.dart';
import 'package:wallcraft/view/account/detailUser.dart';
import 'package:wallcraft/view/account/login.dart';
import 'package:wallcraft/view/home_drawer.dart';
import 'package:wallcraft/view/wallpaper_change_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/favourite_drawer.dart';
import 'view/history_drawer.dart';
import 'dart:convert';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => changePage()),
      ],
      child: MyApp(),
    ),
  );
}

final pages = [
  home_drawer(),
  wallpaper_change_drawer(),
  favourite_drawer(),
  history_drawer(),
];
final titlePage = ['Home', 'Wallpaper change', 'Favourite', 'History'];

class changePage extends ChangeNotifier {
  int _indexPage = 0;

  int get IndexPage => _indexPage;

  void newPage(int i) {
    _indexPage = i;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? user = User();
  @override
  void initState() {
    super.initState();
    print("initState buil lại");
    getUserFromSharedPreferences();
  }
  Future<void> saveUserToSharedPreferences(User user)async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString('user', userJson);
  }
  Future<void> getUserFromSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if(userJson != null){
      final userMap = jsonDecode(userJson);
      print(userMap.toString());
      setState(() {
        if(userMap != null){
          user = User.fromJson(userMap);
        }

      });
    }
  }
  @override
  Widget build(BuildContext context) {
      // getUserFromSharedPreferences();
      user = context.watch<AuthProvider>().user;
      // if(user != null){
      //   saveUserToSharedPreferences(user!);
      // }


    print("user myapp  : ${user?.isLogin}");
    int index = context.watch<changePage>().IndexPage;
    print("buil tiếp");
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: pages[context.watch<changePage>().IndexPage],
      drawer: DrawerMenu(index),
    );
  }
}
