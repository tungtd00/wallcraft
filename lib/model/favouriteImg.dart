class FavouriteImg {
  String? src;
  bool isFavourite = false;

  FavouriteImg(this.src, this.isFavourite);

  Map<String, dynamic> toMap() {
    return ({
      "scr": src,
      "isfav": isFavourite,
    });
  }
}
