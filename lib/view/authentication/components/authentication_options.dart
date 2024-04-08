import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationOptions extends StatelessWidget {
  const AuthenticationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF00704A), width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    leading: const Icon(Icons.phone_iphone,
                        size: 23, color: Color(0xFF00704A)),
                    title: Text(
                      "Continue with phone",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF00704A), fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF00704A), width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/google_icon.png",
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      "Continue with Google",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF00704A), fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF00704A), width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    leading: const Icon(Icons.mail_outline,
                        size: 23, color: Color(0xFF00704A)),
                    title: Text(
                      "Log in with email",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF00704A), fontSize: 15),
                    ),
                  ),
                ),
              ),
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
                    Text(
                      " Sign up",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: const Color(0xFF00704A)),
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
