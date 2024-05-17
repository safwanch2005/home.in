import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/chatcontroller.dart';
import 'package:real_estate_application/view/chat/chatting_screen/chatting_screen.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class ChatList extends StatelessWidget {
  ChatList({super.key});
  final userCtrl = Get.put(ChatController());
  List users = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: userCtrl.userList.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              onTap: () async {
                Get.to(() => const ChattingScreen());
              },
              leading: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: AppThemeData.themeColorShade,
                    borderRadius: BorderRadius.circular(50)),
                child: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage(
                    "assets/profile.jpeg",
                  ),
                ),
              ),
              title: Text(userCtrl.userList[index].userName),
              subtitle: const Text('message here ....'),
              trailing: Text(
                'Last seen...',
                style: GoogleFonts.poppins(color: AppThemeData.grey),
              ),
            );
          }),
    );
  }
}
