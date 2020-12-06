// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.token,
    this.user,
  });

  String token;
  User user;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.fullName,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String role;
  String fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    role: json["role"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "role": role,
    "fullName": fullName,
  };
}
