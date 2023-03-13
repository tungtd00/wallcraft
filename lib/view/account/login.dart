import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/provider/auth_provider.dart';
import 'package:wallcraft/view/account/sign_up.dart';
import 'package:wallcraft/view_model/auth_view_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _pass_controller = TextEditingController();
  bool _showpass = true;

  @override
  Widget build(BuildContext context) {
    var height_device = MediaQuery.of(this.context).size.height;
    var width_device = MediaQuery.of(this.context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 1, child: Container()),
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
              child: Text("Đăng nhập",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
          ),
          Flexible(
              flex: 4,
              child: Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: _email_controller,
                          decoration: InputDecoration(
                            errorText: context
                                        .watch<AuthProvider>()
                                        .errorEmailLogin
                                        .length !=
                                    0
                                ? context.watch<AuthProvider>().errorEmailLogin
                                : null,
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email or username",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white60),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: _pass_controller,
                              obscureText: _showpass,
                              decoration: InputDecoration(
                                errorText: context
                                        .watch<AuthProvider>()
                                        .errorPassLogin
                                        .isNotEmpty
                                    ? context
                                        .watch<AuthProvider>()
                                        .errorPassLogin
                                    : null,
                                prefixIcon: Icon(Icons.lock),
                                labelText: "password",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white60),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showpass = !_showpass;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  _showpass ? "SHOW" : "HIDE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        // color: Colors.yellowAccent,
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthViewModel().checkLoginValid(
                          context,
                          _email_controller.text.toString(),
                          _pass_controller.text.toString());
                    },
                    child: Text("Đăng nhập"),
                  ),
                ),
              )),
          Flexible(
            flex: 2,
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
                                    builder: (context) => SignUp()));
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
    );
  }
}
