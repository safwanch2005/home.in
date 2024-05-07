import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/authentication/components/sign_up_form.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Welcome to",
                style: GoogleFonts.rye(color: AppThemeData.green, fontSize: 55),
                textAlign: TextAlign.end,
              ),
              Text(
                "Home.in",
                style: GoogleFonts.rye(color: AppThemeData.green, fontSize: 65),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Create account with easy and fast method",
                style: GoogleFonts.poppins(
                    color: AppThemeData.white, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const SignUpForms()
            ],
          ),
        ),
      ),
    );
  }
}
