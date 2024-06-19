import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/authentication/email_verification_page.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/error.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});

  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  bool? isAgreedTermsAndConditions = false;
  final ctrl = Get.put(AuthController());

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
          titleText: "Email",
          hintText: "Email",
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
              checkColor: AppThemeData.green,
              fillColor: MaterialStateProperty.all<Color>(AppThemeData.white),
              value: isAgreedTermsAndConditions,
              onChanged: (value) {
                setState(() {
                  isAgreedTermsAndConditions = value;
                });
              },
            ),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                    'https://safwanch2005.github.io/home.in.privacypolicy/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  errorSnackBar("Error", "Failed to launch");
                }
              },
              child: RichText(
                text: TextSpan(
                  text: "I agree with ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppThemeData.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Terms of Conditions and Privacy\nPolicy",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppThemeData.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " (Click here to read)",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppThemeData.themeColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
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
                    AppThemeData.green,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              onPressed: () async {
                await ctrl.signUp(
                  userName: ctrl.userName.text,
                  userEmail: ctrl.email.text,
                  password: ctrl.password.text,
                  confirmPassword: ctrl.confirmPassword.text,
                  context: context,
                );
                if (!isAgreedTermsAndConditions!) {
                  Get.snackbar(
                      "Error", "Please agree to the terms and conditions",
                      colorText: AppThemeData.red,
                      snackPosition: SnackPosition.BOTTOM);
                  return;
                }
                if (auth.currentUser != null) {
                  Get.to(() => const EmailVerificationPage());
                }
              },
              child: ctrl.loading.value
                  ? CircularProgressIndicator(
                      color: AppThemeData.white,
                    )
                  : Text(
                      "sign up",
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
                "Already have an account?",
                style: GoogleFonts.poppins(
                    fontSize: 15, color: AppThemeData.black),
              ),
              InkWell(
                onTap: () => Get.off(const AuthenticationPage()),
                child: Text(
                  " Log in",
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
