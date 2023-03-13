import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallcraft/model/favouriteImg.dart';

class FavouriteDb {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "favouriteImg"),
        version: 1, onCreate: (db, version) async {
      await db.execute('CREAT TABLE favourite(src TEXT,isFavourite BIT)');
    });
  }

  addFavourite(FavouriteImg img) async {
    final db = await database;
    db!.insert("favourite", img.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
