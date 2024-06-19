import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile/components/edit_profile_text_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile/components/image_edit.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile/components/save_edit_button.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile/components/title_text.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const EditProfileTitleText(),
            const ProfileImageEdit(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            EditProfileTextField(),
            SaveEditProfileButtom()
          ],
        ),
      ),
    );
  }
}
