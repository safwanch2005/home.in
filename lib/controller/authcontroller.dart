import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/model/user_model.dart';
import 'package:real_estate_application/view/home/home_page.dart';

class AuthController extends GetxController {
  //create instance
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController resetEmail = TextEditingController();
  var loading = false.obs;

  //create function

  //create account with email and password
  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print("----------------created user----------------");
      await addUser();
      print("----------------added user----------------");
      await verifyEmail();
      print("----------------verified email----------------");
      Get.to(() => HomePage());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  //add user to database
  addUser() async {
    UserModel user = UserModel(
      userName: userName.text,
      email: auth.currentUser?.email,
    );
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("profile")
        .add(user.toMap());
    print("added to data base");
  }

  //Sign out
  signOut() async {
    await auth.signOut();
  }

  //sign in
  signIn() async {
    try {
      loading.value = true;

      await auth.signInWithEmailAndPassword(
          email: loginEmail.text, password: loginPassword.text);
      Get.to(HomePage());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  //verify email
  verifyEmail() async {
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar("email", "send");
  }
}
