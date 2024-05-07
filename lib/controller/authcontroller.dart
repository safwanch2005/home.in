import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate_application/model/user_model.dart';
import 'package:real_estate_application/view/authentication/components/otp_verification_page.dart';
import 'package:real_estate_application/view/authentication/components/username_num.dart';
import 'package:real_estate_application/view/bottom_nav/bottom_navbar.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController resetPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  String verifyId = "";
  bool userWithNumExists = false;
  Rx<bool?> isAgree = Rx<bool?>(null);
  var loading = false.obs;
  var isEmailVerified = false.obs;
  RxString username = "".obs;
  Rx<bool> emailVerified = Rx<bool>(false);

  //create account with email and password
  Future<User?> signUp({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    if (userName.isEmpty || userEmail.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your name and email",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
    // Check if password and confirmPassword match
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match.",
          snackPosition: SnackPosition.BOTTOM);
      //  loading.value = true;
      return null;
    } else if (password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a password",
        snackPosition: SnackPosition.BOTTOM,
      );
      //  loading.value = true;
      return null;
    }

    if (isAgree.value == false) {
      Get.snackbar("Error", "Please accept terms and conditions.",
          snackPosition: SnackPosition.BOTTOM);
      //loading.value = true;
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

  passwordReset() async {
    try {
      await auth.sendPasswordResetEmail(
        email: resetPassword.text.trim(),
      );
      Get.snackbar('Success', 'Password reset link sent to your email.',
          colorText: Colors.green, snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified.value) {
      Get.snackbar('Success', 'Email Successfully Verified.',
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(() => BottomNavBar());
    } else {
      Get.snackbar('Error', 'Please verify your email. Check your mail',
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }

  //add user to database
  addUser(UserModel user) async {
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("profile")
        .add(user.toMap());
  }

  //Sign out
  signOut() async {
    await auth.signOut();
  }

  //sign in
  signIn() async {
    if (loginEmail.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your email",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
    // Check if password and confirmPassword match
    if (loginPassword.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a password",
        snackPosition: SnackPosition.BOTTOM,
      );
      //  loading.value = true;
      return null;
    }
    try {
      loading.value = true;

      await auth.signInWithEmailAndPassword(
          email: loginEmail.text, password: loginPassword.text);

      Get.offAll(() => BottomNavBar());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
      loading.value = false;
    }
  }

  //sign in with google
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // Sign out from Google to force account selection
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await auth.signInWithCredential(credential);
        Get.to(() => BottomNavBar());
      }
    } catch (e) {
      Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  sentOtp() async {
    try {
      //check if a user with the given phone number already exists
      QuerySnapshot snapshot = await db
          .collection('users')
          .where('phoneNumber', isEqualTo: '+91${phoneNumber.text}')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // If a user with the given phone number already exists, retrieve their name from the database
        userWithNumExists = true;
        DocumentSnapshot userDoc = snapshot.docs.first;
        String userName = userDoc['name'];

        Get.snackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}',
            snackPosition: SnackPosition.BOTTOM,
            titleText: Text(
              'Welcome back, $userName!',
              style: GoogleFonts.poppins(),
            ));

        await auth.verifyPhoneNumber(
            phoneNumber: "+91${phoneNumber.text}",
            verificationCompleted: (PhoneAuthCredential credential) async {
              // Handle automatic verification
            },
            verificationFailed: (FirebaseAuthException e) {
              // Handle verification failure
              if (e.code == 'invalid-phone-number') {
                Get.snackbar('Error', 'The provided phone number is not valid.',
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                Get.snackbar('Error', 'An error occurred. ${e.toString()}',
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            codeSent: (String verificationId, [int? resendToken]) {
              verifyId = verificationId;
              // Handle code sent
              Get.snackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}',
                  snackPosition: SnackPosition.BOTTOM);
              Get.to(() => OtpVerificationPage());
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              // Handle auto-retrieval timeout
            });
      } else {
        // If a user with the given phone number does not exist, proceed with sending the OTP and verifying it as before
        userWithNumExists = false;
        await auth.verifyPhoneNumber(
            phoneNumber: "+91${phoneNumber.text}",
            verificationCompleted: (PhoneAuthCredential credential) async {
              User? user = auth.currentUser;
              if (user == null) {
                // Create a new user
                UserCredential userCredential =
                    await auth.signInWithCredential(credential);
                User? newUser = userCredential.user;
                if (newUser != null) {
                  // Add the new user to the Firestore database
                  await db.collection('users').doc(newUser.uid).set({
                    'phoneNumber': newUser.phoneNumber,
                    'name': userName.text, // Add the user's name here
                    'createdAt': Timestamp.now(),
                  });
                }
              }
            },
            verificationFailed: (FirebaseAuthException e) {
              // Handle verification failure
              if (e.code == 'invalid-phone-number') {
                Get.snackbar('Error', 'The provided phone number is not valid.',
                    snackPosition: SnackPosition.BOTTOM);
              } else {
                Get.snackbar('Error', 'An error occurred. ${e.toString()}',
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            codeSent: (String verificationId, [int? resendToken]) {
              verifyId = verificationId;
              // Handle code sent
              Get.snackbar('Success', 'OTP sent to + 91 ${phoneNumber.text}',
                  snackPosition: SnackPosition.BOTTOM);
              Get.to(() => OtpVerificationPage());
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              // Handle auto-retrieval timeout
            });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  verifyOtp() async {
    final cred = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: otp.text);
    try {
      final user = await auth.signInWithCredential(cred);
      if (user.user != null) {
        Get.snackbar("Success", "OTP verified",
            snackPosition: SnackPosition.BOTTOM);

        if (auth.currentUser!.displayName != null) {
          Get.to(() => BottomNavBar());
        } else {
          Get.to(() => UserNameNumSignUp());
          saveUserNameNum();
        }
      } else {
        Get.snackbar("Error", "OTP not verified",
            snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  saveUserNameNum() async {
    if (userName.text.isEmpty) {
      Get.snackbar("Error", "Please enter a username",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (auth.currentUser!.displayName == null) {
      print("====================================");
      await auth.currentUser!.updateDisplayName(userName.text);
      Get.snackbar("Success", "username has been saved",
          snackPosition: SnackPosition.BOTTOM);

      print(auth.currentUser);
      Get.to(() => BottomNavBar());
    }
    //else {
    //   Get.snackbar("Error", "-----", snackPosition: SnackPosition.BOTTOM);
    // }
  }
}
