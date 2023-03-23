import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/DrawerMenu.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/provider/auth_provider.dart';
import 'package:wallcraft/provider/favourite_provider.dart';
import 'package:wallcraft/view/account/detailUser.dart';
import 'package:wallcraft/view/account/login.dart';
import 'package:wallcraft/view/dialog/loading_dialog.dart';
import 'package:wallcraft/view/home_drawer.dart';
import 'package:wallcraft/view/wallpaper_change_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallcraft/view/widget/appbar_home.dart';
import 'view/favourite_drawer.dart';
import 'view/history_drawer.dart';
import 'dart:convert';

void main() {
  print("main");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => changePage()),
        ChangeNotifierProvider<FavouriteProvider>(create: (_) =>FavouriteProvider()),
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

    print("myapp");
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


  @override
  Widget build(BuildContext context) {
    // LoadingDialog.hideLoadingDialog(context);
    int index= context.watch<changePage>().IndexPage;
    return Scaffold(
        appBar:AppBarHome(),
        body: pages[context.watch<changePage>().IndexPage],
    drawer: DrawerMenu(index),
    );

  }
}
