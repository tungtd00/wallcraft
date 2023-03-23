class FavouriteImg {
  String? src;
  int? userId;

  FavouriteImg({this.src, this.userId});


  @override
  String toString() {
    return 'FavouriteImg{src: $src, userId: $userId}';
  }

  Map<String, dynamic> toMap() {
    return ({
      "src": src,
      "userId":userId,
    });
  }
}
