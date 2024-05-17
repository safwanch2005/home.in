import 'package:flutter/material.dart';
import 'package:real_estate_application/view/chat/components/chat_list.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

import 'components/appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      appBar: appbar(),
      body: ChatList(),
    );
  }
}
