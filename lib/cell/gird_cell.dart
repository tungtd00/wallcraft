import 'package:flutter/material.dart';
import 'package:wallcraft/model/photo.dart';

class PhotoCell extends StatelessWidget {
  @required
  final photo photos;

  const PhotoCell(this.photos);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: ClipRect(
              child: Hero(
                tag: "Photo${photos.id}",
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/no_image.jpg',
                  image: photos.thumbnailUrl.toString(),
                ),
              ),
            ))
          ],
        ));
  }
}
