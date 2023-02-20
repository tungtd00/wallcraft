import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wallcraft/model/photo.dart';
class home_tab extends StatefulWidget  {
  const home_tab({Key? key}) : super(key: key);

  @override
  State<home_tab> createState() => _home_tabState();
}

class _home_tabState extends State<home_tab>  with AutomaticKeepAliveClientMixin {
  // gridView (AsyncSnapshot<List<String>> snapshot){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    List<dynamic> list_img = [];
    for(var i=1;i<=21;i++){
      String str = 'assets/img_home/anh$i.jpg';
      list_img.add(str);

    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
            childAspectRatio: 9/16,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: list_img.length,
          itemBuilder: ( context, index) {
            return GridTile(
                child: InkWell(
                  onTap: (){

                  },
                  child: Hero(
                    tag: list_img[index],
                    child:Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),

                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(

                            list_img[index],
                            fit: BoxFit.cover,
                          ),
                        ) ,


                    ) ,
                    
                  ),
                )
            );


          },

          // children: [
          //   for(var i=1;i<21;i++)
          //     Image.asset(
          //       'assets/img_home/anh$i.jpg',
          //       fit: BoxFit.cover,
          //     ),
          //
          //
          // ],
        )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



