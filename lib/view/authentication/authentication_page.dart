import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/authentication/components/authentication_options/authentication_options.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/green_car.jpeg",
                  fit: BoxFit.fill,
                  //height: MediaQuery.of(context).size.height * 0.771,
                  height: MediaQuery.of(context).size.height * 0.83,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back to",
                  style:
                      GoogleFonts.rye(color: AppThemeData.white, fontSize: 40),
                ),
                Text(
                  "Home.in",
                  style:
                      GoogleFonts.rye(color: AppThemeData.white, fontSize: 60),
                ),
              ],
            ),
          ),
          AuthenticationOptions(),
        ],
      ),
    );
  }
}
