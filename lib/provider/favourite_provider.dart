import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/database/favouriteDb.dart';
import 'package:wallcraft/model/favouriteImg.dart';
import 'package:wallcraft/model/users.dart';

class FavouriteProvider extends ChangeNotifier{
  bool? _boolFavourite;
  bool? get boolFavourite => _boolFavourite;

  Future<bool> checkFavourite(String src,int userId ) async {
    print("kiểm tra có yt chưa");
    FavouriteDb favouriteDb = FavouriteDb();
    List<FavouriteImg> favouriteImg = await favouriteDb.getFavouriteBySrcAndUserId(src, userId);
    print(favouriteImg.toString());
    if(favouriteImg.length ==0){
      print("khong có trong yt");
      _boolFavourite = false;
      notifyListeners();
      return false;
    }
    else{
      print("có trong yt");
      _boolFavourite = true;
      print(_boolFavourite);
      notifyListeners();
      return true;
    }
  }
  Future<void> addFavourite(String src,int userId)async{
    FavouriteDb favouriteDb = FavouriteDb();
    FavouriteImg img = FavouriteImg(src: src,userId: userId);
    await favouriteDb.addFavourite(img);
    _boolFavourite = true;
    notifyListeners();
  }
  Future<void> removeFavourite(String src,int userId)async{
    FavouriteDb favouriteDb = FavouriteDb();
    FavouriteImg img = FavouriteImg(src: src,userId: userId);
    await favouriteDb.removeFauvorite(img);
    _boolFavourite = false;
    notifyListeners();
  }
  Future<List<FavouriteImg>?> getListFavouriteByUser(int userId)async{
    FavouriteDb favouriteDb = FavouriteDb();
    List<FavouriteImg>? listImg = await favouriteDb.getFavouriteByUser(userId);
    return listImg;
  }

}