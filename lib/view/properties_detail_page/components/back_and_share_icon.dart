import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class BackAndShareIcon extends StatelessWidget {
  const BackAndShareIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              radius: 23,
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 25,
                color: AppThemeData.themeColor,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.black26,
            radius: 23,
            child: Icon(
              Icons.share,
              size: 25,
              color: AppThemeData.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
