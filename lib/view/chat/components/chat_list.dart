import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/chatcontroller.dart';
import 'package:real_estate_application/view/chat/components/message_bubble.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class ChatList extends StatelessWidget {
  ChatList({super.key});
  final chatCtrl = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: StreamBuilder(
          stream: chatCtrl.getMessage(),
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
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: snapshot.data!.docs.asMap().entries.map((e) {
                  int index = e.key;
                  // var document = e.value;
                  var doc = snapshot.data!.docs[index];
                  return messageBubble(doc);
                }).toList(),
              );
            }
          }),
    );
  }
}
