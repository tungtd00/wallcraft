import 'package:flutter/material.dart';

import '../../model/imageAPI.dart';
import '../fullScreen.dart';

class Full extends StatefulWidget {
  imageApi? imgApi;

  Full({super.key, required this.imgApi});

  @override
  State<Full> createState() => _FullState();
}

class _FullState extends State<Full> {
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
              image: NetworkImage(widget.imgApi!.urls!.raw.toString()),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              alignment: Alignment.center,
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
