import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/chat/chatting_screen/components/appbar.dart';
import 'package:real_estate_application/view/chat/chatting_screen/components/msg_widget.dart';
import 'package:real_estate_application/view/chat/chatting_screen/send_msg_options.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double initialX = 0.0;
    double finalX = 0.0;
    final ScrollController scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          initialX = details.localPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          finalX = details.localPosition.dx;
        },
        onHorizontalDragEnd: (details) {
          if (finalX - initialX > 0) {
            Get.back();
          } else {
            // while swiping from right to left
          }
        },
        child: Scaffold(
          appBar: appbar(),
          body: Stack(
            children: [
              MessageWidget(scrollController: scrollController),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: SendMessageOptions()),
            ],
          ),
        ),
      ),
    );
  }
}
