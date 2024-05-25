import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PriceRangeFilter extends StatefulWidget {
  PriceRangeFilter({super.key});
  int? startingRange;
  int? endingRange;
  @override
  State<PriceRangeFilter> createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  final propCtrl = Get.put(PropertyController());
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPriceFilterDialog(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppThemeData.background,
        ),
        child: Text(
          "Price range : ${propCtrl.startingRange ?? 'N/A'} - ${propCtrl.endingRange ?? 'N/A'}",
          style: GoogleFonts.poppins(color: AppThemeData.themeColor),
        ),
      ),
    );
  }

  showPriceFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppThemeData.themeColor,
          title: GestureDetector(
            onTap: () {
              Get.back();
              setState(() {});
            },
            child: Column(
              children: [
                Text(
                  'Set price range',
                  style: GoogleFonts.poppins(
                      color: AppThemeData.background, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: startPriceController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Set starting range')),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: endPriceController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Set ending range')),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppThemeData.themeColorShade),
                        onPressed: () {
                          propCtrl.startingRange = null;
                          propCtrl.endingRange = null;
                          startPriceController.clear();
                          endPriceController.clear();
                          Get.back();
                          setState(() {});
                        },
                        child: Text(
                          'CLEAR',
                          style: GoogleFonts.poppins(
                              color: AppThemeData.background, fontSize: 20),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppThemeData.themeColorShade),
                        onPressed: () {
                          propCtrl.startingRange =
                              int.parse(startPriceController.text);
                          propCtrl.endingRange =
                              int.parse(endPriceController.text);
                          Get.back();
                          setState(() {});
                        },
                        child: Text(
                          'SET',
                          style: GoogleFonts.poppins(
                              color: AppThemeData.background, fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
