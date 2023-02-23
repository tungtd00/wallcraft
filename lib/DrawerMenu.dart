import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/img_bia.png',
                ),
                fit: BoxFit.cover,
              )),
              child: Container(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Container(
                    // color: Colors.blue,
                    width: 50,
                    height: 50,
                    child: Row(
                      children: [
                        Image.asset(
                          alignment: Alignment.centerLeft,
                          'assets/images/logo_wallcreft.png',
                        ),
                        Text(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            "WALLSCEFT")
                      ],
                    ),
                  ))),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(

                color: context.watch<changePage>().IndexPage == 0
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.home,
              color: context.watch<changePage>().IndexPage == 0
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () {
              selectDestination(0);
              setState(() {
                //   indexClicked = 0;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text(
              'Wallpaper Changer',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 1
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.wallpaper_outlined,
              color: context.watch<changePage>().IndexPage == 1
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () {
              selectDestination(1);
              setState(() {
                // indexClicked = 1;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text(
              'Favorites',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 2
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.favorite,
              color: context.watch<changePage>().IndexPage == 2
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () {
              selectDestination(2);
              setState(() {
                //indexClicked = 2;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text(
              'History',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 3
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.history,
              color: context.watch<changePage>().IndexPage == 3
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () {
              selectDestination(3);
              setState(() {
                // indexClicked = 3;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text(
              'Basic subscription',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 4
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.subscriptions,
              color: context.watch<changePage>().IndexPage == 4
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => selectDestination(4),
          ),
          ListTile(
            title: Text(
              'Subscription AI Artist',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 5
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.color_lens,
              color: context.watch<changePage>().IndexPage == 5
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => selectDestination(5),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 6
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.settings,
              color: context.watch<changePage>().IndexPage == 6
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => selectDestination(6),
          ),
          ListTile(
            title: Text(
              'Support',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 7
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.mail,
              color: context.watch<changePage>().IndexPage == 7
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => print("Support"),
          ),
          ListTile(
            title: Text(
              'Our TikTok',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 8
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.tiktok,
              color: context.watch<changePage>().IndexPage == 8
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => print("Our TikTok"),
          ),
          ListTile(
            title: Text(
              'Teams & Privacy',
              style: TextStyle(
                color: context.watch<changePage>().IndexPage == 9
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            leading: Icon(
              Icons.info_outline,
              color: context.watch<changePage>().IndexPage == 9
                  ? Colors.blue
                  : Colors.black87,
            ),
            onTap: () => print("Teams & Privacy"),
          ),
          Divider(),
          ListTile(
            title: Text('All Categories'),
            onTap: () => print("All Categories"),
            trailing: ClipOval(
              child: Container(
                color: Colors.black12,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('3D'),
            onTap: () => print("3D"),
          ),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      context.read<changePage>().newPage(index);
    });
  }
}
