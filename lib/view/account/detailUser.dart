import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallcraft/database/userDb.dart';
import 'package:wallcraft/main.dart';
import 'package:wallcraft/model/users.dart';
import 'package:wallcraft/provider/auth_provider.dart';

class DetailUser extends StatelessWidget {
  const DetailUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            subtitle: Text("Tên"),
            title: Text("${user.name}"),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            subtitle: Text("Phone"),
            title: Text("${user.phone}"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("${user.email}"),
            subtitle: Text("email"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
            child: ElevatedButton(
                onPressed: () async {
                  User userUpdate = User(
                      id: user.id,
                      name: user.name,
                      phone: user.phone,
                      email: user.email,
                      password: user.password,
                      isLogin: 0);
                  UserDb userDb = UserDb();
                  await context.read<AuthProvider>().logoutUser(user);
                  Navigator.pop(context);
                },
                child: Text("Logout")),
          )
        ],
      ),
    );
  }
}
