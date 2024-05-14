import 'package:flutter/material.dart';
import 'package:real_estate_application/view/properties_detail_page/components/save_and_message_button/message_button.dart';
import 'package:real_estate_application/view/properties_detail_page/components/save_and_message_button/save_button.dart';

class SaveAndMessageButton extends StatelessWidget {
  SaveAndMessageButton(
      {super.key, required this.propId, required this.isSaved});

  dynamic propId;
  dynamic isSaved;
  @override
  Widget build(BuildContext context) {
    print(isSaved);
    print(propId);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SaveButton(propId: propId, isSaved: isSaved),
        const MessageButton(),
      ],
    );
  }
}
