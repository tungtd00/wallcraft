class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  int? isLogin;

  @override
  String toString() {
    return 'User{id: $id, name: $name, phone: $phone, email: $email, password: $password, isLogin: $isLogin}';
  }

  User(
      {this.name,
      this.phone,
      this.email,
      this.password,
      this.isLogin,
      this.id});

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "is_login": isLogin,
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isLogin'] = this.isLogin;
    return data;
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      isLogin: (json['isLogin'] != null ? int.parse(json['isLogin'].toString()) : null ) ,
    );
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[id];
    name = map[name];
    phone = map[phone];
    email = map[email];
    password = map[password];
    isLogin = map[isLogin];
  }
}
