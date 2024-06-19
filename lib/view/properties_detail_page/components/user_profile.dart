import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class UserProfileDetailsPage extends StatefulWidget {
  UserProfileDetailsPage({super.key, required this.propData});
  dynamic propData;

  @override
  State<UserProfileDetailsPage> createState() => _UserProfileDetailsPageState();
}

class _UserProfileDetailsPageState extends State<UserProfileDetailsPage> {
  final authCtrl = Get.put(AuthController());

  List data = ['', null];
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    data = await authCtrl.getUserDetailsByUId(widget.propData["userId"]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(propData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            "Posted by",
            style: GoogleFonts.poppins(
                fontSize: 25, color: AppThemeData.themeColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: AppThemeData.background,
            boxShadow: [
              BoxShadow(
                color: AppThemeData.themeColor.withOpacity(0.5), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppThemeData.themeColor
                          .withOpacity(0.4), // Shadow color
                      spreadRadius: 1, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: const Offset(0, 3), // Offset
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black12,
                  backgroundImage: data[1] == null
                      ? const AssetImage(
                          "assets/profile.jpeg",
                        ) as ImageProvider
                      : NetworkImage(data[1].toString()),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                data[0] ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 30, color: AppThemeData.themeColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
