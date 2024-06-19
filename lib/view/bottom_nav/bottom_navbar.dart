import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/indexcontroller.dart';
import 'package:real_estate_application/view/all_properties/all_properties_page.dart';
import 'package:real_estate_application/view/chat/chat_page.dart';
import 'package:real_estate_application/view/home/home_page.dart';
import 'package:real_estate_application/view/location/location_page.dart';
import 'package:real_estate_application/view/profile/profile.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  var indexctrl = Get.put(IndexController());

  List<Widget> pages = [
    const HomePage(),
    const LocationPage(),
    const AllPropertiesPage(),
    const ChatPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => pages.elementAt(indexctrl.index.value)),
          // backgroundColor: AppThemeData.amber,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppThemeData.background,
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodySmall:
                        GoogleFonts.poppins(color: AppThemeData.themeColor),
                  ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: indexctrl.index.value,
                selectedItemColor: AppThemeData.themeColor,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: AppThemeData.background,
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      size: 20,
                      color: AppThemeData.themeColor,
                    ),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 20,
                      color: AppThemeData.themeColor,
                    ),
                    label: 'location',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.building,
                      size: 20,
                      color: AppThemeData.themeColor,
                    ),
                    label: "properties",
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () async {
                        // await chatCtrl.getUserProfile();
                        indexctrl.index.value = 3;
                      },
                      child: FaIcon(
                        FontAwesomeIcons.comments,
                        size: 20,
                        color: AppThemeData.themeColor,
                      ),
                    ),
                    label: 'message',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                      color: AppThemeData.themeColor,
                    ),
                    label: "profile",
                  ),
                ],
                onTap: (values) {
                  indexctrl.index.value = values;

                  indexctrl.fromHomeTextField = false;
                },
              ),
            ),
          )),
    );
  }
}
