import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallcraft/model/users.dart';

class UserDb {
  static Database? _database;

  static final String tableUsers = 'user';
  static final String columName = 'name';
  static final String columnPhone = 'phone';
  static final String columnId = 'id';
  static final String columnEmail = 'email';
  static final String columnPassword = 'password';
  static final String columnIsLoggedIn = 'is_login';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), "users.db"),
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''
              CREATE TABLE $tableUsers(
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columName TEXT,
                $columnPhone TEXT,
                $columnEmail TEXT,
                $columnPassword TEXT,
                $columnIsLoggedIn INT)
           ''');
      },
    );
  }

  addUser(User user) async {
    final db = await database;
    await db?.insert(tableUsers, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> upDateUser(User user) async {
    final db = await database;
    db?.update(tableUsers, user.toMap());
  }

  Future<dynamic> login(String email, String pass) async {
    final db = await database;
    final map = await db?.query(tableUsers,
        where: ' email = ? AND password = ?', whereArgs: [email, pass]);
    print("map lay email pass : ${map?.length}");
    List<Map<String, dynamic>>? maps = map;
    if (maps != null) {
      return List.generate(maps.length, (i) {
        return User(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            password: maps[i]['password'],
            isLogin: maps[i]['isLogin']);
      });
    } else {
      return null;
    }
  }

  Future<dynamic> isLogin() async {
    final db = await database;
    final map = await db
        ?.query(tableUsers, where: '$columnIsLoggedIn = ?', whereArgs: [1]);
    List<Map<String, dynamic>>? maps = map;
    print("map : ${map}");
    if (maps != null) {
      return List.generate(maps.length, (i) {
        return User(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            password: maps[i]['password'],
            isLogin: maps[i]['isLogin']);
      });
    } else {
      return null;
    }
  }

  Future<dynamic> getUserByEmail(String email) async {
    final db = await database;
    final result = await db
        ?.query(tableUsers, where: "${columnEmail} = ?", whereArgs: [email]);
    final List<Map<String, dynamic>>? maps = result;
    // List<User>? list = res?.map((map) => User.fromMap(map!)).toList();
    if (maps != null) {
      return List.generate(maps.length, (i) {
        return User(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            password: maps[i]['password'],
            isLogin: maps[i]['isLogin']);
      });
    } else {
      return null;
    }
  }

  Future<List<User>?> getUser() async {
    final db = await database;
    var map = await db?.query(tableUsers);
    List<Map<String, dynamic>>? maps = map;
    print("map : ${map}");
    if (maps != null) {
      return List.generate(maps.length, (i) {
        return User(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            password: maps[i]['password'],
            isLogin: maps[i]['isLogin']);
      });
    } else {
      return null;
    }
  }
}
