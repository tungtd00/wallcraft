import 'package:flutter/material.dart';
import 'package:wallcraft/cell/gird_cell.dart';
import 'package:wallcraft/network/network_request.dart';

import '../../model/photo.dart';

class exclusive_tab extends StatefulWidget {
  const exclusive_tab({Key? key}) : super(key: key);

  @override
  State<exclusive_tab> createState() => _exclusive_tabState();
}

class _exclusive_tabState extends State<exclusive_tab>
    with AutomaticKeepAliveClientMixin {
  gridview(AsyncSnapshot<Iterable<photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              gotoDetailsPage(context, photo);
            },
          );
        }).toList(),
      ),
    );
  }

  gotoDetailsPage(BuildContext context, photo photos) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: FutureBuilder<Iterable<photo>>(
                    future: NetworkRequest.fetchPhotos(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error ${snapshot.hasError}");
                      } else if (snapshot.hasData) {
                        return gridview(snapshot);
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }))
          ],
        ),
        // body: GridView(
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 150,
        //     childAspectRatio: 0.5,
        //     crossAxisSpacing: 5,
        //     mainAxisSpacing: 5,
        //   ),
        //   children: [
        //     for(var i=1;i<21;i++)
        //       Image.asset(
        //         'assets/img_home/anh$i.jpg',
        //         fit: BoxFit.cover,
        //       )
        //
        //   ],
        // )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
