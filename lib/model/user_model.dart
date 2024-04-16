import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, userName, email;
  UserModel({this.email, this.id, this.userName});

  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
      email: map["email"],
      userName: map["userName"],
      id: map.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "userName": userName,
    };
  }
}
