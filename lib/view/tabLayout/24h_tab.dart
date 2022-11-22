import 'package:flutter/material.dart';
class tab_24h extends StatefulWidget {
  const tab_24h({Key? key}) : super(key: key);

  @override
  State<tab_24h> createState() => _tab_24hState();
}

class _tab_24hState extends State<tab_24h> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 0.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: [
            for(var i=1;i<21;i++)
              Image.asset(
                'assets/img_home/anh$i.jpg',
                fit: BoxFit.cover,
              )
          ],
        )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
