import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/DrawerMenu.dart';
import 'package:wallcraft/view/home_drawer.dart';
import 'package:wallcraft/view/wallpaper_change_drawer.dart';

import 'view/favourite_drawer.dart';
import 'view/history_drawer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
  // 'basic_subscription_drawer'
  // 'artist_drawer'
  // 'settings_drawer'
  // 'support_drawer'
  // 'our_tiktok'
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
  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(titlePage[context.watch<changePage>().IndexPage]),
      ),
      body: pages[context.watch<changePage>().IndexPage],
      drawer: DrawerMenu(),
    );
  }
}
