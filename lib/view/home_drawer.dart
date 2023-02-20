import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/view/tabLayout/home_tab.dart';
import 'tabLayout/24h_tab.dart';
import 'tabLayout/artist_tab.dart';
import 'tabLayout/exclusive_tab.dart';
import 'tabLayout/video_tab.dart';

class home_drawer extends StatefulWidget {
  const home_drawer({Key? key}) : super(key: key);

  @override
  State<home_drawer> createState() => _home_drawerState();
}
Color PrimaryColor =  Color(0xff109618);

final tabs_name = [
  'HOME',
  'AI ARTIST',
  'EXCLUSIVE',
  'VIDEO',
  '24H'];
final page_tab = [
  home_tab(),
  AI_artist_tab(),
  exclusive_tab(),
  video_tab(),
  tab_24h()
];

class _home_drawerState extends State<home_drawer>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => indexSort() ),
      ],
      child: home(),
    );
  }
}

class indexSort extends ChangeNotifier {
  int _indextab =0;
  void swichtab(int index){
    _indextab = index;
    print("index : $_indextab");
  }
  int get Indextab => _indextab;

}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: tabs_name.length, vsync: this);
    _tabController.addListener(() {
      int i = _tabController.index;
        context.read<indexSort>().swichtab(i);

    });


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOME',
      home: DefaultTabController(
          length: tabs_name.length,
          child: Scaffold(

              backgroundColor: PrimaryColor,
              appBar:TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                indicatorColor: Colors.amber,
                isScrollable: true,
                tabs: [
                  for (final tab in tabs_name) Tab(text: tab),
                ],
               
              ),
              body:
                  Container(
                    color: Colors.white,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        for (final tab in page_tab)
                          tab,
                      ],
                    ),

                  )
          )),
    );;
  }
}

