import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallcraft/model/favouriteImg.dart';

class FavouriteDb {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(
        await getDatabasesPath(), "favouriteImg.db"),
        version: 1,
        onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE favourite(src TEXT,userId INT,
      FOREIGN KEY (userId) REFERENCES user(id))
          ''');
    });
  }

  Future<void>addFavourite(FavouriteImg img) async {
    final db = await database;
    db!.insert("favourite", img.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> removeFauvorite(FavouriteImg img)async {
    final db = await database;
    db?.delete("favourite",where:'userId = ? AND src =? ',whereArgs: [img.userId,img.src]  );

  }
  Future<dynamic>getFavouriteBySrcAndUserId(String src, int userId) async {
    final db = await database;
    final maps = await db?.query("favourite",where: 'src = ? AND userId =?',whereArgs: [src,userId]);
    List<Map<String, dynamic>>? map = maps;
    if(map != null){
      return List.generate(map.length, (i){
          return FavouriteImg(
            src: map[i]['src'],
            userId: map[i]['userId']
          );
      });
    }
    else{
      return null;
    }
  }
  Future<List<FavouriteImg>?>getFavouriteByUser( int userId) async {
    final db = await database;
    final maps = await db?.query("favourite",where: ' userId =?',whereArgs: [userId]);
    List<Map<String, dynamic>>? map = maps;
    if(map != null){
      return List.generate(map.length, (i){
        return FavouriteImg(
            src: map[i]['src'],
            userId: map[i]['userId']
        );
      });
    }
    else{
      return null;
    }
  }

}
