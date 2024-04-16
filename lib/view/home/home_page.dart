import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthController ctrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Home Page"),
            TextButton(
                onPressed: () async {
                  await auth.signOut();
                  Get.offAll(() => const AuthenticationPage());
                },
                child: Text(
                  "log out",
                  style: GoogleFonts.poppins(fontSize: 20),
                ))
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            auth.currentUser!.emailVerified
                ? Column(
                    children: [
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Text(
                        ctrl.username.value,
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "${auth.currentUser!.email!} not verified",
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: ElevatedButton(
                          onPressed: () {
                            try {
                              FirebaseAuth.instance.currentUser
                                  ?.sendEmailVerification();
                            } catch (e) {
                              debugPrint('$e');
                            }
                          },
                          child: Text(
                            "send verification link",
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
            const SizedBox(
              height: 150,
            ),
            Text(
              auth.currentUser!.email!,
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.purple),
            ),
            Text(
              auth.currentUser!.emailVerified
                  ? "email Verified"
                  : "email not verified",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
