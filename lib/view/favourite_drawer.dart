import 'package:flutter/material.dart';

class favourite_drawer extends StatefulWidget {
  const favourite_drawer({Key? key}) : super(key: key);

  @override
  State<favourite_drawer> createState() => _favourite_drawerState();
}

class _favourite_drawerState extends State<favourite_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("favorite"),
      ),
    );
  }
}
