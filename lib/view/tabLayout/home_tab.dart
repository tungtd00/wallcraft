import 'package:flutter/material.dart';
class home_tab extends StatefulWidget  {
  const home_tab({Key? key}) : super(key: key);

  @override
  State<home_tab> createState() => _home_tabState();
}

class _home_tabState extends State<home_tab>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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



