import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/email_auth.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/google_auth.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/phone_auth.dart';
import 'package:real_estate_application/view/authentication/signup_page.dart';

class AuthenticationOptions extends StatelessWidget {
  const AuthenticationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PhoneAuth(),
              const SizedBox(height: 15),
              const GoogleAuth(),
              const SizedBox(height: 15),
              const EmailAuth(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const SignUpPage()),
                      child: Text(
                        " Sign up",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: const Color(0xFF00704A)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
