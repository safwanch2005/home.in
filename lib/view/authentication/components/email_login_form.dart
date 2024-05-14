import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/authentication/components/email_pw_reset_page.dart';
import 'package:real_estate_application/view/authentication/signup_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class EmailLogInForm extends StatelessWidget {
  EmailLogInForm({super.key});
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
        GestureDetector(
          onTap: () => Get.to(() => EmailPasswordResetPage()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppThemeData.green,
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.36,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Obx(
            () => ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppThemeData.green,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              onPressed: () async {
                await ctrl.signIn();
                // Get.to(() => HomePage());
              },
              child: ctrl.loading.value
                  ? CircularProgressIndicator(
                      color: AppThemeData.white,
                    )
                  : Text(
                      "Log in",
                      style: GoogleFonts.poppins(
                          color: AppThemeData.white, fontSize: 20),
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
                style: GoogleFonts.poppins(
                    fontSize: 15, color: AppThemeData.black),
              ),
              InkWell(
                onTap: () => Get.to(const SignUpPage()),
                child: Text(
                  " Sign up",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: AppThemeData.green,
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
