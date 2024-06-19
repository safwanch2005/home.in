import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/chat_controller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/chat/chatting_screen/chatting_screen.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

Padding messageBubble(
    String username, String? imageUrl, String friendID, String? friendToken) {
  final chatCtrl = Get.put(ChatController());

  return Padding(
    padding: const EdgeInsets.all(10),
    child: ListTile(
      onTap: () async {
        await chatCtrl.getOrCreateChat(auth.currentUser!.uid, friendID);
        Get.to(
          () => ChattingScreen(
            friendId: friendID,
            friendToken: friendToken,
          ),
          transition: Transition.rightToLeft,
        );
      },
      leading: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: AppThemeData.themeColorShade,
            borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.black12,
          backgroundImage: imageUrl == null
              ? const AssetImage(
                  "assets/profile.jpeg",
                ) as ImageProvider
              : NetworkImage(
                  imageUrl,
                ),
        ),
      ),
      title: Text(
        username,
        style: GoogleFonts.poppins(),
      ),
      subtitle: Text(
        "message",
        style: GoogleFonts.poppins(color: AppThemeData.grey),
      ),
    ),
  );
}
