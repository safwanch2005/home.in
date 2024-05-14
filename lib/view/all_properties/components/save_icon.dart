import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class SaveIconAllProp extends StatefulWidget {
  SaveIconAllProp({super.key, required this.propId, required this.isSaved});

  dynamic propId;
  dynamic isSaved;

  @override
  State<SaveIconAllProp> createState() => _SaveIconAllPropState();
}

class _SaveIconAllPropState extends State<SaveIconAllProp> {
  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.isSaved) {
          await ctrl.savedProperties(widget.propId, false);
          widget.isSaved = false;
        } else {
          await ctrl.savedProperties(widget.propId, true);
          widget.isSaved = true;
        }
      },
      child: Icon(
        widget.isSaved ? Icons.favorite : Icons.favorite_border_outlined,
        color: AppThemeData.themeColor,
        size: 30,
      ),
    );
  }
}
