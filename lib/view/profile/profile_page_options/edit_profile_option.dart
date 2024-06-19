import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/profile/profile_page_options/custom_botton.dart';
import 'package:real_estate_application/view/profile/profile_page_options/edit_profile/edit_profile_page.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final ctrl = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ctrl.userName.text = auth.currentUser!.displayName!;
        Get.to(EditProfilePage());
      },
      child: ProfileCustomBotton(
        icon: FontAwesomeIcons.userPen,
        text: "Edit profile",
      ),
    );
  }
}
