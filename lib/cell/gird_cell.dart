import 'package:flutter/material.dart';
import 'package:wallcraft/model/photo.dart';

class PhotoCell extends StatelessWidget {
  @required
  final photo photos;

  const PhotoCell(this.photos);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
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
                        placeholder :'assets/images/no_image.jpg',
                        image: photos.thumbnailUrl.toString(),
                        width: 100,
                        height: 100,
                      ),
                    ),


              ))
            ],


          ),
        ),
      ),
    );
  }
}
