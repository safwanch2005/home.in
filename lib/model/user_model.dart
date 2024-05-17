import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';

class UserModel {
  String? id, userName, email, password;
  UserModel({this.email, this.id, this.userName, this.password});

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map["email"],
      userName: map["userName"],
      password: map["password"],
      id: map["id"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "userName": userName,
      "password": password,
      "id": id,
    };
  }
}
