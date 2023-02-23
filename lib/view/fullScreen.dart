import 'package:flutter/material.dart';
import 'package:wallcraft/view/home_drawer.dart';

class FullScreen extends StatelessWidget {
  int index;

  FullScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(

          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img_home/anh${index + 1}.jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(

                alignment: Alignment.center,
                color: Colors.white,

                icon:Icon(Icons.close,size:25 ,),
                  onPressed:(){
                    print("close");
                    Navigator.pop(context);
                  },
                ),
            ),
            Container(
              alignment: Alignment.bottomCenter,


            )
          ],

      ),
    );
  }
}
