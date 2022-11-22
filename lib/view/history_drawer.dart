import 'package:flutter/material.dart';

class history_drawer extends StatefulWidget {
  const history_drawer({Key? key}) : super(key: key);

  @override
  State<history_drawer> createState() => _history_drawerState();
}

class _history_drawerState extends State<history_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("history"),
      ),
    );
  }
}
