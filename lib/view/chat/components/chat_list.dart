import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/controller/chat_controller.dart';
import 'package:real_estate_application/view/chat/components/message_bubble.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class ChatList extends StatelessWidget {
  ChatList({super.key});
  final chatCtrl = Get.put(ChatController());
  final authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: StreamBuilder(
          stream: chatCtrl.getMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppThemeData.themeColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "no messages",
                  style: GoogleFonts.poppins(
                    color: AppThemeData.themeColorShade,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return FutureBuilder<List<List<dynamic>>>(
                future: chatCtrl.getListChatWith(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppThemeData.themeColor,
                    ));
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No chats available'));
                  }

                  final chatList = snapshot.data!;

                  return ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (ctx, index) {
                      final userDetails = chatList[index];

                      return messageBubble(userDetails[0], userDetails[1],
                          userDetails[2], userDetails[3]);
                    },
                  );
                },
              );
            }
          }),
    );
  }
}
