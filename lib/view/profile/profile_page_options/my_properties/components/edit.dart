import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/loading.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class EditMyProp extends StatelessWidget {
  EditMyProp({super.key, required this.id});

  dynamic id;
  final propCtrl = Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),
          onPressed: () async {
            Get.to(() => const LoadingPage());
            PropertyController.propertyId = id;
            PropertyController.editMode = true;
            final data =
                await propCtrl.db.collection("properties").doc(id).get();
            PropertyController.dataForEdit = data;
            Get.back();
            if (data['category'] == 'Land') {
              propCtrl.getDataForEdit(true);
              Get.to(() => FormPage(isLand: true));
            } else {
              propCtrl.getDataForEdit(false);

              Get.to(() => FormPage(isLand: false));
            }
          },
          child: Text(
            'Edit',
            style: GoogleFonts.poppins(color: AppThemeData.background),
          ),
        ));
  }
}
