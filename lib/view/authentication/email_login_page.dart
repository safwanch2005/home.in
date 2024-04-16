import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/authentication/components/email_login_form.dart';

class LogInWithEmail extends StatelessWidget {
  const LogInWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Welcome back to",
                style: GoogleFonts.rye(
                    color: const Color(0xFF00704A), fontSize: 45),
                textAlign: TextAlign.start,
              ),
              Text(
                "Home.in",
                style: GoogleFonts.rye(
                    color: const Color(0xFF00704A), fontSize: 65),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              EmailLogInForm()
            ],
          ),
        ),
      ),
    );
  }
}
