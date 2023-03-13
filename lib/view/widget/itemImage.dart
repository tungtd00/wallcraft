import 'package:flutter/material.dart';
import 'package:wallcraft/model/imageAPI.dart';

class ItemImage extends StatelessWidget {
  var imgData = <imageApi>[];

  ItemImage({required this.imgData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          maxCrossAxisExtent: 200,
          mainAxisExtent: 250),
      itemCount: imgData.length,
      itemBuilder: (context, index) {
        return GridTile(
            child: InkWell(
          onTap: () {},
          child: Image.network(imgData[index].urls!.raw.toString()),
        ));
      },
    );
  }
}
