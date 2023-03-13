import 'package:flutter/material.dart';
import 'package:wallcraft/model/imageAPI.dart';
import 'package:wallcraft/view/widget/full.dart';

import '../../network/image_service.dart';

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
          body: FutureBuilder<Iterable<imageApi>>(
              future: ImageService.fetchImage(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error ${snapshot.hasError}");
                } else if (snapshot.hasData) {
                  return gridview(snapshot);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget gridview(AsyncSnapshot<Iterable<imageApi>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        children: snapshot.data!.map((image) {
          return GestureDetector(
            child: GridTile(
              child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Hero(
                        tag: "Photo${image.id}",
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/no_image.jpg',
                          image: image.urls!.raw.toString(),
                        ),
                      ))
                    ],
                  )),
            ),
            onTap: () {
              gotoDetailsPage(context, image);
            },
          );
        }).toList(),
      ),
    );
  }

  void gotoDetailsPage(BuildContext context, imageApi imageApi) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Full(imgApi: imageApi)));
  }
}
