import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/controller/chat_controller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/chat/chatting_screen/chatting_screen.dart';

import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class MessageButton extends StatelessWidget {
  MessageButton({super.key, required this.propData});
  final chatCtrl = Get.put(ChatController());
  final authCtrl = Get.put(AuthController());
  dynamic propData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 60,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppThemeData.themeColor),
        onPressed: () async {
          await chatCtrl.getOrCreateChat(
              auth.currentUser!.uid, propData['userId']);
          final data = await authCtrl.getUserDetailsByUId(propData['userId']);
          Get.to(
            () => ChattingScreen(
              friendId: propData["userId"],
              friendToken: data[3],
            ),
            transition: Transition.rightToLeft,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.comments,
                size: 20, color: AppThemeData.background),
            Text(
              "chat",
              style: GoogleFonts.poppins(
                  fontSize: 25, color: AppThemeData.background),
            ),
          ],
        ),
      ),
    );
  }
}
