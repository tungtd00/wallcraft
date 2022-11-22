import 'package:flutter/material.dart';

class wallpaper_change_drawer extends StatefulWidget {
  const wallpaper_change_drawer({Key? key}) : super(key: key);

  @override
  State<wallpaper_change_drawer> createState() =>
      _wallpaper_change_drawerState();
}

class _wallpaper_change_drawerState extends State<wallpaper_change_drawer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wallpaper change',
        home: Scaffold(
          body: Center(
            child: Text("Wallpaper change"),
          ),
        ));
  }
}
