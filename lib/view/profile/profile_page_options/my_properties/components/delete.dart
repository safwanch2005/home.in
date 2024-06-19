import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class DeleteMyProp extends StatelessWidget {
  DeleteMyProp({super.key, required this.id});

  dynamic id;
  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            showDeleteConfirmationDialog(context);
          },
          child: Text(
            'remove',
            style: GoogleFonts.poppins(color: AppThemeData.background),
          ),
        ));
  }

  showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppThemeData.background,
          title: Text(
            'Confirm Deletion',
            style: GoogleFonts.poppins(color: AppThemeData.themeColor),
          ),
          content: Text(
            'Are you sure you want to delete this item?',
            style: GoogleFonts.poppins(
                fontSize: 20, color: AppThemeData.themeColor),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: AppThemeData.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                await ctrl.deleteProperty(id);
              },
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
