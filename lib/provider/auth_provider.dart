import 'package:flutter/material.dart';
import 'package:wallcraft/database/userDb.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/valid/validUser.dart';

import '../main.dart';

class AuthProvider extends ChangeNotifier {
  String _errorEmailLogin = "";
  String _errorPassLogin = "";
  String _errorEmailSignUp = "";
  String _errorPassSignUp = "";
  String _name = "";
  String _phone = "";

  String get errorEmailLogin => _errorEmailLogin;

  String get errorPassLogin => _errorPassLogin;

  String get errorEmailSignUp => _errorEmailSignUp;

  String get errorPassSignUp => _errorPassSignUp;

  String get name => _name;

  String get phone => _phone;
  ValidUser validUser = ValidUser();
  User? _user = User();

  User? get user => _user;

  bool isValidLogin(String email, String pass) {
    if (validUser.isValidEmail(email)) {
      _errorEmailLogin = "";
      if (validUser.isValidPass(pass)) {
        _errorPassLogin = "";
        notifyListeners();
        return true;
      } else {
        _errorPassLogin = "Password từ 6 kí tự trở lên";
        notifyListeners();
        return false;
      }
    } else {
      _errorEmailLogin = "Email có định dạng abc@mail.com";
      notifyListeners();
      return false;
    }
  }

  bool isValidSignUp(String name, String phone, String email, String pass) {
    if (validUser.isValidName(name)) {
      _name = "";
      notifyListeners();
      if (validUser.isValidPhone(phone)) {
        _phone = "";
        notifyListeners();
        if (validUser.isValidEmail(email)) {
          _errorEmailSignUp = "";
          notifyListeners();
          if (validUser.isValidPass(pass)) {
            _errorPassSignUp = "";
            notifyListeners();
            return true;
          } else {
            _errorPassSignUp = "mật khẩu ít nhất có 6 kí tự";
            notifyListeners();
            return false;
          }
        } else {
          _errorEmailSignUp = "email có dạng abc@gmail.com";
          notifyListeners();
          return false;
        }
      } else {
        _phone = "sđt không được để trống";
        notifyListeners();
        return false;
      }
    } else {
      _name = "Tên không được để trống";

      notifyListeners();
      return false;
    }
  }

  addUser(BuildContext context, User user) async {
    UserDb userDb = UserDb();
    await userDb.addUser(user);
    loginProvider(context, user.email.toString(), user.password.toString());
  }
  loginProvider(BuildContext context, String email, String pass) async {
    UserDb userDb = UserDb();
    print("cbi lấy user email pass");
    List<User> users = await userDb.login(email, pass);
    print("list user ${users.length}");
    if (users != Null) {
      print("users ko null : ${users.first.email}");
      _user = users.first;
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      _user = null;
      notifyListeners();
    }
  }

  upDateUser(User user) {
    UserDb().upDateUser(user);
    _user = null;
  }

  Future<bool> isEmailExist(String email) async {
    UserDb userDb = UserDb();
    List<User> user = await userDb.getUserByEmail(email);
    if (user != null) {
      _errorEmailSignUp = "Email đã tồn tại";
      notifyListeners();
      return true;
    } else {
      _errorEmailSignUp = "";
      notifyListeners();
      return false;
    }
  }

  Future<User?> isLogin() async {
    UserDb userDb = UserDb();
    List<User> user = await userDb.isLogin();
    for (User u in user) {
      print("aaa : ${u}");
    }
    if (user != null) {
      _user = user.first;
      notifyListeners();
      return user.first;
    } else {
      _user = null;
      notifyListeners();
      return null;
    }
  }
}
