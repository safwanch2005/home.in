import 'package:flutter/material.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/properties_detail_page/components/save_and_message_button/message_button.dart';
import 'package:real_estate_application/view/properties_detail_page/components/save_and_message_button/save_button.dart';

// ignore: must_be_immutable
class SaveAndMessageButton extends StatelessWidget {
  SaveAndMessageButton(
      {super.key,
      required this.propId,
      required this.isSaved,
      required this.propData});

  dynamic propId;
  dynamic isSaved;
  dynamic propData;
  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser!.uid;
    return Row(
      mainAxisAlignment: propData['userId'] == user
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceAround,
      children: [
        SaveButton(propId: propId, isSaved: isSaved),
        propData['userId'] == user
            ? const SizedBox.shrink()
            : MessageButton(propData: propData),
      ],
    );
  }
}
