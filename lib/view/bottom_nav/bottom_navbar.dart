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

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  var indexctrl = Get.put(IndexController());

  List<Widget> pages = [
    HomePage(),
    const LocationPage(),
    const AllPropertiesPage(),
    const ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => pages.elementAt(indexctrl.index.value)),
          backgroundColor: const Color.fromARGB(255, 64, 64, 64),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodySmall: GoogleFonts.poppins(color: Colors.white),
                  ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: indexctrl.index.value,
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                    label: "home",
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 20,
                    ),
                    label: 'location',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.building,
                      size: 20,
                    ),
                    label: "properties",
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.comments,
                      size: 20,
                    ),
                    label: 'message',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                    ),
                    label: "profile",
                  ),
                ],
                onTap: (values) {
                  indexctrl.index.value = values;
                },
              ),
            ),
          )),
    );
  }
}
