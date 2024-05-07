import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/components/custom_textfield.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class UserNameNumSignUp extends StatelessWidget {
  UserNameNumSignUp({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFielForAuthPage(
              hintText: "enter full name",
              titleText: "User name",
              controller: ctrl.userName,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
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
                    ctrl.saveUserNameNum();
                    // await ctrl.passwordReset();
                    // Get.to(() => HomePage());
                  },
                  child: ctrl.loading.value
                      ? CircularProgressIndicator(
                          color: AppThemeData.white,
                        )
                      : Text(
                          "save",
                          style: GoogleFonts.poppins(
                              color: AppThemeData.white, fontSize: 20),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
