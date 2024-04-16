import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/authentication/signup_page.dart';
import 'package:real_estate_application/view/home/home_page.dart';

class EmailLogInForm extends StatelessWidget {
  EmailLogInForm({super.key});
  bool? isAgreedTermsAndConditions = false;
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        CustomTextFielForAuthPage(
          titleText: "Email",
          hintText: "Enter email",
          controller: ctrl.loginEmail,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFielForAuthPage(
          titleText: "Password",
          hintText: "Password",
          controller: ctrl.loginPassword,
          isPassword: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Obx(
            () => ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF00704A),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              onPressed: () async {
                await ctrl.signIn();
                Get.to(() => HomePage());
              },
              child: ctrl.loading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Log in",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              InkWell(
                onTap: () => Get.to(const SignUpPage()),
                child: Text(
                  " Sign up",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF00704A),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
