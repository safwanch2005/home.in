import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final AuthController ctrl = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    // Check the email verification status when the page is initialized
    ctrl.checkEmailVerified();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          // Display different UI based on email verification status
          if (ctrl.isEmailVerified.value) {
            return Center(
              child: Text(
                "Email Successfully Verified",
                style: GoogleFonts.poppins(fontSize: 30),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Check your Email',
                      style: GoogleFonts.poppins(
                          fontSize: 31,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF00704A)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Center(
                      child: Text(
                        'We have sent you an email on ${FirebaseAuth.instance.currentUser?.email}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                      child: ctrl.emailVerified.value
                          ? Text(
                              "verified",
                              style: GoogleFonts.poppins(
                                  fontSize: 30, color: const Color(0xFF00704A)),
                            )
                          : const CircularProgressIndicator(
                              color: Color(0xFF00704A),
                            )),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Center(
                      child: Text(
                        'Verifying email....',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF00704A),
                        ),
                      ),
                      child: Text(
                        'Resend',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        try {
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification();
                        } catch (e) {
                          debugPrint('$e');
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
