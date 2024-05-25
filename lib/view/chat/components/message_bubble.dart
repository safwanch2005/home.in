import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/chatcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/chat/chatting_screen/chatting_screen.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';
import 'package:intl/intl.dart' as intl;

SizedBox messageBubble(DocumentSnapshot doc) {
  if (auth.currentUser!.displayName == doc['user_name']
      //&& auth.currentUser!.displayName != doc['user_name']
      ) {
    // print(doc['friend_name']);
    return const SizedBox.shrink();
  }
  if (auth.currentUser!.displayName != doc['friend_name']
      //&& auth.currentUser!.displayName != doc['user_name']
      ) {
    // print(doc['friend_name']);
    return const SizedBox.shrink();
  }
  // if (doc['last_msg'] == null) {
  //   return const SizedBox.shrink();
  // }
  final chatCtrl = Get.put(ChatController());
  var t =
      doc['created_on'] == null ? DateTime.now() : doc['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);
  return SizedBox(
    child: ListTile(
      onTap: () async {
        // chatCtrl.friendName = auth.currentUser!.uid == doc['toId']
        //     ? doc["user_name"]
        //     : doc['friend_name'];

        // chatCtrl.friendId =
        //     auth.currentUser!.uid == doc['toId'] ? doc["toId"] : doc['fromId'];
        // await chatCtrl.getChatId();
        //------------------------------
        // chatCtrl.friendId = doc["toId"];
        // chatCtrl.friendName = doc["friend_name"];
        // await chatCtrl.getChatId();
//------------------------------
        //  chatCtrl.friendName =
        // auth.currentUser!.uid == doc['toId']
        //     ? doc['user_name']
        //     :
        //   doc["friend_name"];

        //  chatCtrl.friendId =
        //auth.currentUser!.uid == doc['toId'] ?
        //doc['fromId'] :
        //   doc["toId"];

        chatCtrl.friendId = doc['toId'];
        chatCtrl.friendName = doc['user_name'];
        await chatCtrl.getChatId();
        Get.to(
          () => const ChattingScreen(),
          transition: Transition.rightToLeft,
        );
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
      title: Text(
        auth.currentUser!.uid == doc['toId']
            ? doc['friend_name']
            : doc['user_name'],
        style: GoogleFonts.poppins(),
      ),
      subtitle: Text(
        truncateWithEllipsis(15, doc['last_message'] ?? ''),
      ),
      trailing: Text(
        time,
        style: GoogleFonts.poppins(color: AppThemeData.grey),
      ),
    ),
  );
}

String truncateWithEllipsis(int cutoff, String text) {
  return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
}
