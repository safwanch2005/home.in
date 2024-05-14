import 'package:flutter/material.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PropImageMyProp extends StatelessWidget {
  PropImageMyProp({super.key, required this.imgUrl});
  String imgUrl = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      //width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Placeholder(
          color: AppThemeData.themeColor.withOpacity(0.1),
          child: Image.network(
            imgUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
