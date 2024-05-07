import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter code sent to your phone',
              style: GoogleFonts.poppins(
                color: AppThemeData.green,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextFormField(
                controller: ctrl.otp,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter code",
                  hintStyle: GoogleFonts.poppins(
                      color: AppThemeData.grey, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: AppThemeData.green, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: AppThemeData.green, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.55,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppThemeData.green,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () async {
                  await ctrl.verifyOtp();
                },
                child: Text(
                  'Verify',
                  style: GoogleFonts.poppins(
                      color: AppThemeData.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.55,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppThemeData.greyShade,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () async {
                  await ctrl.sentOtp();
                },
                child: Text(
                  'Resent OTP',
                  style: GoogleFonts.poppins(
                      color: AppThemeData.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: AppThemeData.green,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.045),
          ],
        ),
      ),
    );
  }
}
