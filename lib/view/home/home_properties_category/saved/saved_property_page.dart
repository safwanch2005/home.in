import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/home/home_properties_category/saved/save_button.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/image.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/tittle.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class SavedPropertyPage extends StatefulWidget {
  const SavedPropertyPage({super.key});

  @override
  State<SavedPropertyPage> createState() => _SavedPropertyPageState();
}

class _SavedPropertyPageState extends State<SavedPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      appBar: AppBar(
        backgroundColor: AppThemeData.background,
        foregroundColor: AppThemeData.themeColor,
        title: Text(
          "Saved properties",
          style: GoogleFonts.poppins(
              color: AppThemeData.themeColor,
              fontWeight: FontWeight.w300,
              fontSize: 25),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('properties').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      color: AppThemeData.themeColor));
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error: ${snapshot.error}',
                style: GoogleFonts.poppins(color: AppThemeData.white),
              ));
            }
            final propertiesDocs = snapshot.data?.docs ?? [];
            final filteredProperties = propertiesDocs.where((prop) {
              final propertyData = prop.data() as Map<String, dynamic>;
              final propertySavedList = propertyData['propertySaved'];
              return propertySavedList.contains(auth.currentUser!.uid);
            }).toList();
            return filteredProperties.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.faceFrown,
                            size: 35, color: AppThemeData.themeColorShade),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "No saved properties found\n\n\n\n\n",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: AppThemeData.themeColorShade),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: filteredProperties.length,
                    itemBuilder: (context, index) {
                      final prop = filteredProperties[index];
                      final propData = prop.data() as Map<String, dynamic>;
                      final isFromCurrentUser = propData['propertySaved']
                          .contains(auth.currentUser!.uid);
                      return isFromCurrentUser
                          ? GestureDetector(
                              onTap: () {
                                Get.to(() => PropertiesDetailsPage(
                                      propData: propData,
                                      propId: prop.id,
                                    ));
                              },
                              child: IntrinsicHeight(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  // height: 500,
                                  decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.white54, width: 1),
                                      color: AppThemeData.background,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppThemeData.themeColor
                                              .withOpacity(0.5), // Shadow color
                                          spreadRadius: 5, // Spread radius
                                          blurRadius: 7, // Blur radius
                                          offset: const Offset(0, 3), // Offset
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    children: [
                                      PropImageMyProp(
                                        imgUrl: propData["imageUrls"].first,
                                      ),
                                      TittleMyProp(title: propData['title']),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        child: SaveButtonInSavedPropertyPage(
                                          propId: prop.id,
                                          isSaved: propData['propertySaved']
                                              .contains(auth.currentUser!.uid),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    });
          }),
    );
  }
}
