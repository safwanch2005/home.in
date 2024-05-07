import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/email_auth.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/google_auth.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/phone_auth.dart';
import 'package:real_estate_application/view/authentication/signup_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class AuthenticationOptions extends StatelessWidget {
  AuthenticationOptions({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppThemeData.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhoneAuth(),
              const SizedBox(height: 15),
              GoogleAuth(),
              const SizedBox(height: 15),
              EmailAuth(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: AppThemeData.black),
                    ),
                    InkWell(
                      onTap: () {
                        goToSingUpPage();
                      },
                      child: Text(
                        " Sign up",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: AppThemeData.green),
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

  goToSingUpPage() {
    ctrl.userName.clear();
    ctrl.email.clear();
    ctrl.password.clear();
    ctrl.confirmPassword.clear();
    Get.to(() => const SignUpPage());
  }
}
