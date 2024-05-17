import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/model/user_model.dart';

class ChatController extends GetxController {
  final messageController = TextEditingController();
  final userCtrl = Get.put(AuthController());
  List userList = [];
  var chats = FirebaseFirestore.instance.collection("chats");

  getUserProfile() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      UserModel user = UserModel.fromMap(data);
      userList.add(user);
    }
    return userList;
  }
}
