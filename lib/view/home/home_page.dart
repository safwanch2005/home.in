import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/home/home_properties_category/home_properties_category.dart';
import 'package:real_estate_application/view/home/home_search/home_search.dart';
import 'package:real_estate_application/view/home/near_by_properties/near_by_properties.dart';
import 'package:real_estate_application/view/home/recent_properties/recent_properties.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authCtrl = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authCtrl.getUserData();
    _rebuildPageAfterDelay();
  }

  void _rebuildPageAfterDelay() {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    authCtrl.getUserData();
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Find your\nproperty",
                    style: GoogleFonts.poppins(
                        height: 1.1,
                        color: AppThemeData.themeColor,
                        fontSize: 45,
                        fontWeight: FontWeight.w400),
                  ),
                  CircleAvatar(
                    backgroundColor: AppThemeData.themeColor,
                    radius: 45,
                    backgroundImage: authCtrl.imgUrl == null
                        ? const AssetImage(
                            "assets/profile.jpeg",
                          ) as ImageProvider
                        : NetworkImage(authCtrl.imgUrl!),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Best property search",
                  style: GoogleFonts.poppins(
                      color: AppThemeData.themeColorShade,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              HomeSearch(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const HomePropertiesCategories(),
              const RecentProperties(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const NearByProperties(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
