import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/model/favouriteImg.dart';
import 'package:wallcraft/provider/auth_provider.dart';
import 'package:wallcraft/provider/favourite_provider.dart';

import '../model/users.dart';

class favourite_drawer extends StatefulWidget {
  const favourite_drawer({Key? key}) : super(key: key);

  @override
  State<favourite_drawer> createState() => _favourite_drawerState();
}

class _favourite_drawerState extends State<favourite_drawer> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<AuthProvider>().user;
    return FutureBuilder<Iterable<FavouriteImg>?>(
        future: FavouriteProvider().getListFavouriteByUser(user!.id!),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text("Error ${snapshot.hasError}");
          }
          else if(snapshot.hasData){
            if(snapshot != null){
              return gridView(snapshot);
            }
            else{
              return Container();
            }

          }
          else{
            return CircularProgressIndicator();
          }

        }
    );
  }

  Widget gridView(AsyncSnapshot<Iterable<FavouriteImg>?> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 9/16,
            crossAxisSpacing: 4,
            mainAxisSpacing: 1,
          ),
        children: snapshot.data!.map((img){
          print(img.src.toString());
            return GestureDetector(
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Hero(
                          tag: "favourite",
                          child:
                          img.src.toString().contains("assets") ?
                            ClipRRect(
                                child: Image.asset(img.src.toString())):
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              alignment: Alignment.center,
                              child: FadeInImage.assetNetwork(
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                placeholder: 'assets/images/no_image.jpg',
                                image:img.src.toString() ,
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {

              },
            );
          }).toList(),

      ),
    );

  }
}
