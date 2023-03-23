import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/provider/auth_provider.dart';
import 'package:wallcraft/view/account/login.dart';
import 'package:wallcraft/view_model/auth_view_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

bool _showPass = false;
TextEditingController _email_controller = TextEditingController();
TextEditingController _pass_controller = TextEditingController();
TextEditingController _name_controller = TextEditingController();
TextEditingController _phone_controller = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var errorTextName = context.watch<AuthProvider>().name;
    var errorTextPhone = context.watch<AuthProvider>().phone;
    var errorEmail = context.watch<AuthProvider>().errorEmailSignUp;
    var errorPass = context.watch<AuthProvider>().errorPassSignUp;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Image.asset(
                  "assets/images/logo_wallcreft.png",
                  height: 150,
                  width: 150,
                )),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text("Đăng kí tài khoản",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Flexible(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: _name_controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box_outlined),
                          errorText:
                              errorTextName.length == 0 ? null : errorTextName,
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white60),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: _phone_controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          errorText: errorTextPhone.length == 0
                              ? null
                              : errorTextPhone,
                          labelText: "Phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white60),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: _email_controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          errorText: errorEmail.length == 0 ? null : errorEmail,
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.white60),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _pass_controller,
                            obscureText: !_showPass,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              errorText:
                                  errorPass.length == 0 ? null : errorPass,
                              labelText: "password",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white60),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPass = !_showPass;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                _showPass ? "HIDE" : "SHOW",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        AuthViewModel authViewModel = AuthViewModel();
                        var name = _name_controller.text.toString();
                        var phone = _phone_controller.text.toString();
                        var email = _email_controller.text.toString();
                        var pass = _pass_controller.text.toString();
                        User user = User(
                            name: name,
                            phone: phone,
                            email: email,
                            password: pass,
                            isLogin: 1);
                        if (await authViewModel.checkSignUpValid(context, name, phone, email, pass)) {
                          await authViewModel.signupViewModel(context, user);
                        }
                      },
                      child: Text("Đăng kí"),
                    ),
                  ),
                )),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                          text: "Sign up for a new account",
                          style: TextStyle(color: Colors.blue, fontSize: 13),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
