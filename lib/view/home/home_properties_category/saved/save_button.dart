import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class SaveButtonInSavedPropertyPage extends StatefulWidget {
  SaveButtonInSavedPropertyPage(
      {super.key, required this.propId, required this.isSaved});

  dynamic propId;
  dynamic isSaved;
  @override
  // ignore: library_private_types_in_public_api
  _SaveButtonInSavedPropertyPageState createState() =>
      _SaveButtonInSavedPropertyPageState();
}

class _SaveButtonInSavedPropertyPageState
    extends State<SaveButtonInSavedPropertyPage> {
  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeData.themeColor,
        ),
        onPressed: () async {
          setState(() {});
          if (widget.isSaved) {
            await ctrl.savedProperties(widget.propId, false);
            widget.isSaved = false;
          } else {
            await ctrl.savedProperties(widget.propId, true);
            widget.isSaved = true;
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.isSaved ? Icons.favorite : Icons.favorite_border_outlined,
              size: 20,
              color: AppThemeData.background,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.isSaved ? "saved" : "save",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: AppThemeData.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
