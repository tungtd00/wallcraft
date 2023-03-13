import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  int index;

  FullScreen({super.key, required this.index});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

bool checkFavourite = false;

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/img_home/anh${widget.index + 1}.jpg'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              alignment: Alignment.topLeft,
              color: Colors.white,
              icon: Icon(
                Icons.close,
                size: 25,
              ),
              onPressed: () {
                print("close");
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(8),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          checkFavourite = !checkFavourite;
                        });
                      },
                      icon: checkFavourite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border_outlined)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
