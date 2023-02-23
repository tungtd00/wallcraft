import 'package:flutter/material.dart';

class AI_artist_tab extends StatefulWidget {
  const AI_artist_tab({Key? key}) : super(key: key);

  @override
  State<AI_artist_tab> createState() => _AI_artist_tabState();
}

class _AI_artist_tabState extends State<AI_artist_tab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: Colors.black87,
        child: GridView(
          addAutomaticKeepAlives: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 0.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: [
            for (var i = 1; i < 21; i++)
              Image.asset(
                'assets/img_home/anh$i.jpg',
                fit: BoxFit.cover,
              )
          ],
        ),
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
