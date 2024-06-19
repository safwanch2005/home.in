import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/all_properties/components/category_text.dart';
import 'package:real_estate_application/view/all_properties/components/title.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/admin_response.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/delete.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/edit.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/prop_image.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/prop_sold.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class MyPropertiesPage extends StatelessWidget {
  const MyPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      appBar: AppBar(
        backgroundColor: AppThemeData.background,
        foregroundColor: AppThemeData.themeColor,
        title: Text(
          "My properties",
          style: GoogleFonts.poppins(
              color: AppThemeData.themeColor,
              fontWeight: FontWeight.w300,
              fontSize: 25),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('properties')
              .where('userId', isEqualTo: auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error: ${snapshot.error}',
                style: GoogleFonts.poppins(color: AppThemeData.white),
              ));
            }
            final propertiesDocs = snapshot.data?.docs ?? [];

            return propertiesDocs.isEmpty
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
                          "No properties found\n\n\n\n\n",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: AppThemeData.themeColorShade),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: propertiesDocs.length,
                        itemBuilder: (context, index) {
                          final prop = propertiesDocs[index];
                          final propData = prop.data() as Map<String, dynamic>;

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => PropertiesDetailsPage(
                                        propData: propData,
                                        propId: prop.id,
                                      ),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: AppThemeData.background,
                                border: Border.all(
                                    color: AppThemeData.themeColor, width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppThemeData.themeColor
                                        .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  MyPropImage(
                                    imgUrl: propData["imageUrls"].first,
                                    isSold: propData['isSold'],
                                  ),
                                  CategoryText(
                                    category: propData['category'],
                                    type: propData['type'],
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: TitleAllProp(
                                        title: propData["title"],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      EditMyProp(
                                        id: prop.id,
                                      ),
                                      DeleteMyProp(
                                        id: prop.id,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PropSold(
                                    propId: prop.id,
                                    isSold: propData['isSold'],
                                  ),
                                  AdminResponeStatus(
                                    isAccepted: propData['isAccepted'],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
          }),
    );
  }
}
