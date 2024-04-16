import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/authentication/email_verification_page.dart';
import 'package:real_estate_application/view/home/home_page.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});

  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  bool? isAgreedTermsAndConditions = false;
  final ctrl = Get.put(AuthController());
  // var ctrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        CustomTextFielForAuthPage(
          titleText: "Full name",
          hintText: "Full name",
          controller: ctrl.userName,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFielForAuthPage(
          titleText: "Email or number",
          hintText: "Email or number",
          controller: ctrl.email,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFielForAuthPage(
          titleText: "Password",
          hintText: "Password",
          controller: ctrl.password,
          isPassword: true,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFielForAuthPage(
          titleText: "Confirm password",
          hintText: "Confirm password",
          controller: ctrl.confirmPassword,
          isPassword: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
        ),
        Row(
          children: [
            Checkbox(
              checkColor: const Color(0xFF00704A),
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              value: isAgreedTermsAndConditions,
              onChanged: (value) {
                setState(() {
                  isAgreedTermsAndConditions = value;
                });
              },
            ),
            Text(
              "I agree with Terms of Conditions and Privacy Policy",
              style: GoogleFonts.poppins(fontSize: 16),
            )
          ],
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
                ctrl.loading.value = true;
                await ctrl.signUp(
                  userName: ctrl.userName.text,
                  userEmail: ctrl.email.text,
                  password: ctrl.password.text,
                  confirmPassword: ctrl.confirmPassword.text,
                  context: context,
                );
                if (auth.currentUser != null) {
                  Get.to(const EmailVerificationPage());
                }
                ctrl.loading.value = true;
              },
              child: ctrl.loading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "sign up",
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
                "Already have an account?",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
              ),
              InkWell(
                onTap: () => Get.off(const AuthenticationPage()),
                child: Text(
                  " Log in",
                  style: GoogleFonts.poppins(
                      fontSize: 15, color: const Color(0xFF00704A)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
