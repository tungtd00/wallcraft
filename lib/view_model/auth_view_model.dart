import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/provider/auth_provider.dart';

class AuthViewModel extends ChangeNotifier {
  Future<void> checkLoginValid(
      BuildContext context, String email, String pass) async {
    if (context.read<AuthProvider>().isValidLogin(email, pass)) {
      context.read<AuthProvider>().loginProvider(context, email, pass);
    }
  }

  Future<bool> checkSignUpValid(BuildContext context, String name, String phone,
      String email, String pass) async {
    if (context.read<AuthProvider>().isValidSignUp(name, phone, email, pass)) {
      if (await context.read<AuthProvider>().isEmailExist(email)) {
        return true;
      }
    }
    return false;
  }

  Future<dynamic> signupViewModel(BuildContext context, User user) async {
    if (await context
        .read<AuthProvider>()
        .isEmailExist(user.email.toString())) {
      context.read<AuthProvider>().addUser(context, user);
    }
  }
}
