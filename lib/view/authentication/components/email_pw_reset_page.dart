import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class EmailPasswordResetPage extends StatelessWidget {
  EmailPasswordResetPage({super.key});

  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFielForAuthPage(
              hintText: "enter your email",
              titleText: "",
              controller: ctrl.resetPassword,
            ),
            const SizedBox(
              height: 10,
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
                    await ctrl.passwordReset();
                    // Get.to(() => HomePage());
                  },
                  child: ctrl.loading.value
                      ? CircularProgressIndicator(
                          color: AppThemeData.white,
                        )
                      : Text(
                          "sent password reset link",
                          style: GoogleFonts.poppins(
                              color: AppThemeData.white, fontSize: 20),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            )
          ],
        ),
      ),
    );
  }
}
