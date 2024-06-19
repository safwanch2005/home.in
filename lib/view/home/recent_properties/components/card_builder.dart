import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/all_properties/components/prop_not_found.dart';
import 'package:real_estate_application/view/home/recent_properties/components/recent_image.dart';
import 'package:real_estate_application/view/home/recent_properties/components/recent_prop_cat.dart';
import 'package:real_estate_application/view/home/recent_properties/components/recent_prop_title.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class CardBuilder extends StatelessWidget {
  CardBuilder({super.key});
  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: ctrl.getRecentProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator(color: AppThemeData.themeColor));
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: GoogleFonts.poppins(color: AppThemeData.white),
            ));
          }

          final propertiesDocs = snapshot.data?.docs ?? [];

          return Expanded(
            child: propertiesDocs.isEmpty
                ? propNotFound()
                : Column(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppThemeData.background,
                          boxShadow: [
                            BoxShadow(
                              color: AppThemeData.themeColor.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CardSwiper(
                          duration: const Duration(milliseconds: 100),
                          padding: EdgeInsets.zero,
                          cardsCount: propertiesDocs.length,
                          numberOfCardsDisplayed: 1,
                          allowedSwipeDirection:
                              const AllowedSwipeDirection.only(
                                  right: true, left: true),
                          cardBuilder: (context, index, x, y) {
                            final prop = propertiesDocs[index];
                            final propData =
                                prop.data() as Map<String, dynamic>;
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
                                decoration: BoxDecoration(
                                  color: AppThemeData.background,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    RecentPropImage(
                                      isSold: propData['isSold'],
                                      imgUrl: propData["imageUrls"].first,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RecentPropCat(
                                            category: propData['category'],
                                            type: propData['type'],
                                          ),
                                          RecentPropTitle(
                                            title: propData["title"],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                    ],
                  ),
          );
        });
  }
}
