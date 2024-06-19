import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/indexcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final indexCtrl = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        color: AppThemeData.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset
          ),
        ],
      ),
      child: TextFormField(
        onTap: () {
          indexCtrl.fromHomeTextField = true;
          indexCtrl.index.value = 2;
        },
        readOnly: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 5, 80, 0),
          hintText: 'Search property',
          hintStyle: GoogleFonts.poppins(
              fontSize: 20,
              color: AppThemeData.themeColor,
              fontWeight: FontWeight.w300),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Icon(
              Icons.search,
              color: AppThemeData.themeColor,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
