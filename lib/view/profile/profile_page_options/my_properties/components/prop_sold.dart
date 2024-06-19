import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PropSold extends StatelessWidget {
  PropSold({super.key, required this.isSold, required this.propId});
  bool isSold;
  String propId;
  final propCtrl = Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),
          onPressed: () async {
            await propCtrl.setSoldorNot(propId, !isSold);
          },
          child: Text(
            isSold ? 'Avaliable' : 'Sold',
            //Available
            style: GoogleFonts.poppins(color: AppThemeData.background),
          ),
        ));
  }
}
