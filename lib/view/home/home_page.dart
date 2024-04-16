import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Home Pae"),
            TextButton(
                onPressed: () async {
                  await auth.signOut();
                  Get.offAll(() => const AuthenticationPage());
                },
                child: const Text("log out"))
          ],
        ),
      ),
      body: Column(
        children: [
          auth.currentUser!.emailVerified
              ? const SizedBox(
                  height: 1,
                )
              : Text("${auth.currentUser!.email!} not verified"),
          const SizedBox(
            height: 150,
          ),
          Text(auth.currentUser!.email!),
          Text(
            auth.currentUser!.emailVerified
                ? "email Verified"
                : "email not verified",
          ),
        ],
      ),
    );
  }
}
