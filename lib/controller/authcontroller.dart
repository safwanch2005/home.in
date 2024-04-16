import 'dart:async';

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
  var isEmailVerified = false.obs;
  RxString username = "".obs;

  Timer? timer;
  late StreamSubscription<User?> _authSubscription;
  Rx<bool> emailVerified = Rx<bool>(false);

  emailVerificationController() {
    emailVerified = Rx<bool>(FirebaseAuth.instance.currentUser!.emailVerified);
    _authSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        isEmailVerified.value = user.emailVerified;
      }
    });
  }

  @override
  void onClose() {
    _authSubscription.cancel();
    super.onClose();
  }
  //create function

  //create account with email and password
  Future<User?> signUp({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    // Check if password and confirmPassword match
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match.",
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);

// Send email verification
      await userCredential.user!.sendEmailVerification();
      // Update the username
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(userName);
        await user.reload();
        username.value = userName;
        await addUser(UserModel(
            userName: userName, email: email.text, password: password));
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified.value) {
      Get.snackbar('Success', 'Email Successfully Verified.',
          snackPosition: SnackPosition.BOTTOM);
      timer?.cancel();
      Get.offAll(() => HomePage());
    }
  }

  //add user to database
  addUser(UserModel user) async {
    // UserModel user = UserModel(
    //   userName: userName.text,
    //   email: auth.currentUser?.email,
    //   password: user.password
    // );
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
      // Retrieve the username from the database
      DocumentSnapshot snapshot = await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("profile")
          .doc("profile")
          .get();
      if (snapshot.exists) {
        // Set the value of username
        username.value = (snapshot.data() as Map<String, dynamic>)["userName"];
        print(
            "Username: ${username.value}"); // Add this line to check the value of username
      }
      Get.to(() => HomePage());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }
}
