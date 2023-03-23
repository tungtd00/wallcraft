import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/database/userDb.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/valid/validUser.dart';
import 'package:wallcraft/view/dialog/loading_dialog.dart';
import 'package:wallcraft/view/dialog/msg_dialog.dart';

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
  User? _user = null;

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

  Future<bool> isValidSignUp(BuildContext context,String name, String phone, String email, String pass) async {
    if (validUser.isValidName(name)) {
      _name = "";
      notifyListeners();
      if (validUser.isValidPhone(phone)) {
        _phone = "";
        notifyListeners();
        if (validUser.isValidEmail(email)) {
          _errorEmailSignUp = "";
          notifyListeners();
          if( ! await context.read<AuthProvider>().isEmailExist(email)){
            if (validUser.isValidPass(pass)) {
              _errorPassSignUp = "";
              notifyListeners();
              return true;
            } else {
              _errorPassSignUp = "mật khẩu ít nhất có 6 kí tự";
              notifyListeners();
              return false;
            }
           }
          else{
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

  Future<void> addUser(BuildContext context, User user) async {
    UserDb userDb = UserDb();
    await userDb.addUser(user);
    await loginProvider(context, user.email.toString(), user.password.toString());
  }
  Future<void> loginProvider(BuildContext context, String email, String pass) async {
    UserDb userDb = UserDb();
    print("cbi lấy user email pass");
    List<User> users = await userDb.login(email, pass);
    print("list user khi kiểm tra email pass để đăng nhập : ${users.length}");
    if (users.length != 0) {
      LoadingDialog.showLoadingDialog(context, "Đăng nhập thành công");
      print("users kiểm tra ko null : ${users.first.email}");
      _user = users.first;
      print("user được gán sau khi pass đăng nhập");

      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      String msg = "sai email or password";
      MsgDialog.showMsgDialog(context, "Lỗi đăng nhập", msg);
      print("sai email or password");
    }
  }

  updateUser(User user) {
    // UserDb().upDateUser(user);
    _user = null;
    notifyListeners();
    print("_user gán : ${_user.toString()}");
  }
  updateStateUser(User user){
    _user = user;
    notifyListeners();
  }

  Future<bool> isEmailExist(String email) async {
    print("kiểm tra");
    UserDb userDb = UserDb();
    List<User> user = await userDb.getUserByEmail(email);
    print("email kiểm tra : ${user.toString()}");
    if (user.length == 0) {
      print("email rỗng ${user.toString()}");

      _errorEmailSignUp = "";
      notifyListeners();
      return false;

    } else {
      print("email tồn tại ${user.length}");
      _errorEmailSignUp = "Email đã tồn tại";
      notifyListeners();
      return true;
    }
  }

  Future<User?> isLogin() async {
    UserDb userDb = UserDb();
    List<User> user = await userDb.isLogin();

    if (user != null) {
      _user = user.first;
      notifyListeners();
      return user.first;
    } else {
      print("user gán cho null");
      _user = null;
      notifyListeners();
      return null;
    }
  }
}
