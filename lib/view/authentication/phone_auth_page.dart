import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue with phone',
              style: GoogleFonts.poppins(
                color: AppThemeData.green,
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //padding: const EdgeInsets.symmetric(),
                  alignment: Alignment.center,
                  child: Text(
                    "+ 91  ",
                    style: GoogleFonts.poppins(
                      fontSize: 27,
                      color: AppThemeData.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                    controller: ctrl.phoneNumber,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.poppins(
                        color: AppThemeData.black, fontSize: 22),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Get.snackbar("Error", "number field is empty");
                      } else if (value.length != 10) {
                        Get.snackbar("Error", "Invalid phone number");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your number",
                      hintStyle: GoogleFonts.poppins(
                          color: AppThemeData.grey, fontSize: 22),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: AppThemeData.green, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            BorderSide(color: AppThemeData.green, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppThemeData.green,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () {
                  ctrl.sentOtp();
                },
                child: Text(
                  'Send OTP',
                  style: GoogleFonts.poppins(
                      color: AppThemeData.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
