import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/model/photo.dart';

import '../../model/users.dart';
import '../../provider/auth_provider.dart';
import '../../provider/favourite_provider.dart';
class FullPhoto extends StatefulWidget {
  photo photos ;

  FullPhoto({required this.photos});

  @override
  State<FullPhoto> createState() => _FullPhotoState();
}

class _FullPhotoState extends State<FullPhoto> {
  bool isFavourite = false;
  Future<void> _checkFavourite(String src, User user)async {
    print("check cscscsacascascsaca");
    if(user != null){
      print("user có");
      int? id = user.id;
      await context.read<FavouriteProvider>().checkFavourite(src, id!);
      print("isFavourite là : ${isFavourite}");
    }
    else{
      print("user null");
      isFavourite =false;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<AuthProvider>().user;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.photos.url.toString()),
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
                user != null ?
                FutureBuilder(
                    future: _checkFavourite(widget.photos.url.toString(), user),
                    builder: (context,snapshot){
                      isFavourite = context.watch<FavouriteProvider>().boolFavourite!;
                      print("isFavourite là : ${isFavourite}");
                      if(snapshot.connectionState == ConnectionState.done){
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.all(8),
                          child: IconButton(
                              onPressed: () async {
                                if(user != null){
                                  if(isFavourite){
                                    print("xóa vào yt");
                                    await context.read<FavouriteProvider>().removeFavourite(widget.photos.url.toString(), user.id!);
                                  }
                                  else{
                                    print("thêm là yt");
                                    await context.read<FavouriteProvider>().addFavourite(widget.photos.url.toString(), user.id!);
                                  }
                                }
                              },
                              icon: isFavourite
                                  ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : Icon(Icons.favorite_border_outlined)),
                        );
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    }
                )
                    :
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () {

                    }, icon: Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
