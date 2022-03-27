import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class User {
  String? name;
  String? phone_number;
  String? date_of_birth;
  String? image_path;
  String? account;
  String? password;
  String? passwordHash;
  String? token;

  User(
      {this.name,
      this.phone_number,
      this.date_of_birth,
      this.image_path,
      this.account,
      this.password,
      this.passwordHash,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone_number = json['phone_number'];
    date_of_birth = json['date_of_birth'];
    image_path = json['image_path'];
    account = json['account'];
    password = json['password'];
    passwordHash = json['passwordHash'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone_number'] = this.phone_number;
    data['date_of_birth'] = this.date_of_birth;
    data['image_path'] = this.image_path;
    data['account'] = this.account;
    data['password'] = this.password;
    data['passwordHash'] = this.passwordHash;
    data['token'] = this.token;
    return data;
  }
}
