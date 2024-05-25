import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/chatcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

Row messageField(BuildContext context) {
  final chatCtrl = Get.put(ChatController());

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: AppThemeData.background,
          ),
          child: TextField(
            controller: chatCtrl.messageController,
            style: GoogleFonts.poppins(
                color: AppThemeData.themeColor, fontSize: 20),
            decoration: InputDecoration(
              prefix: const SizedBox(width: 10),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    await chatCtrl.pickAndUploadImage();
                  },
                  child: const Icon(Icons.attachment_outlined)),
              suffixIconColor: AppThemeData.themeColor,
              hintText: "Type here ...",
              hintStyle: GoogleFonts.poppins(color: AppThemeData.themeColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          )),
      GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 25,
          backgroundColor: AppThemeData.themeColor,
          child: Center(
            child: IconButton(
              onPressed: () async {
                await chatCtrl.sentMessage(chatCtrl.messageController.text);
              },
              icon: Icon(
                Icons.send,
                size: 25,
                color: AppThemeData.background,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
