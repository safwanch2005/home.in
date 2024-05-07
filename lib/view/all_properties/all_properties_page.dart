import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/all_properties/components/area_ft.dart';
import 'package:real_estate_application/view/all_properties/components/count_of_items.dart';
import 'package:real_estate_application/view/all_properties/components/category_text.dart';
import 'package:real_estate_application/view/all_properties/components/image.dart';
import 'package:real_estate_application/view/all_properties/components/land_length_breadth.dart';
import 'package:real_estate_application/view/all_properties/components/location.dart';
import 'package:real_estate_application/view/all_properties/components/plot_area.dart';
import 'package:real_estate_application/view/all_properties/components/price.dart';
import 'package:real_estate_application/view/all_properties/components/save_icon.dart';
import 'package:real_estate_application/view/all_properties/components/title.dart';
import 'package:real_estate_application/view/all_properties/search_bar/search_bar.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class AllPropertiesPage extends StatelessWidget {
  const AllPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("properties").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error: ${snapshot.error}',
                  style: GoogleFonts.poppins(color: AppThemeData.white),
                ));
              }

              final propertiesDocs = snapshot.data?.docs ?? [];

              return Column(
                children: [
                  const PropertySearch(),
                  Expanded(
                    child: ListView.builder(
                        itemCount: propertiesDocs.length,
                        itemBuilder: (context, index) {
                          final prop = propertiesDocs[index];
                          final propData = prop.data() as Map<String, dynamic>;

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => PropertiesDetailsPage(
                                    propData: propData,
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              //height: 500,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  ImageAllProp(
                                    imgUrl: propData["imageUrls"].first,
                                  ),
                                  CategoryText(
                                    category: propData['category'],
                                    type: propData['type'],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TitleAllProp(
                                          title: propData["title"],
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: const SaveIconAllProp()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        PriceAllProp(
                                          price: propData["price"],
                                        ),
                                        propData["category"] == "Land"
                                            ? PlotAreaAllProp(
                                                plotArea: propData["plotArea"],
                                              )
                                            : AreaSQ2(
                                                areaSQ2: propData["areaftsq"]),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: propData["category"] == "Land"
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              LandLengthBreadth(
                                                type: "Length :",
                                                value: propData["length"],
                                              ),
                                              LandLengthBreadth(
                                                type: "Breadth :",
                                                value: propData["breadth"],
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CountsOfItems(
                                                items: propData["bedrooms"],
                                                icon: Icons.bed_outlined,
                                              ),
                                              CountsOfItems(
                                                items: propData["bathrooms"],
                                                icon: Icons.bathtub_outlined,
                                              ),
                                              CountsOfItems(
                                                items: propData["floors"],
                                                icon: Icons.layers,
                                              ),
                                            ],
                                          ),
                                  ),
                                  LocationAllProp(
                                      location: propData["location"]),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
