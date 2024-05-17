import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
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
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class AllPropertiesPage extends StatefulWidget {
  const AllPropertiesPage({super.key});

  @override
  State<AllPropertiesPage> createState() => _AllPropertiesPageState();
}

class _AllPropertiesPageState extends State<AllPropertiesPage> {
  @override
  void dispose() {
    ctrl.searchData.value = '';
    super.dispose();
  }

  final ctrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
              color: AppThemeData.background,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color:
                      AppThemeData.themeColor.withOpacity(0.4), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 3), // Offset
                ),
              ],
            ),
            child: TextFormField(
              style: GoogleFonts.poppins(color: AppThemeData.themeColor),
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  ctrl.searchData.value = value;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(0, 5, 80, 0),
                hintText: 'Search property',
                hintStyle: GoogleFonts.poppins(
                    fontSize: 19,
                    color: AppThemeData.themeColor,
                    fontWeight: FontWeight.w300),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(
                    Icons.search,
                    color: AppThemeData.themeColor,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("properties")
                  .snapshots(),
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

                final searchData = ctrl.searchData.toLowerCase();
                final filteredProperties = propertiesDocs.where((prop) {
                  final propData = prop.data() as Map<String, dynamic>;
                  final title = propData['title'].toString().toLowerCase();
                  return title.contains(searchData);
                }).toList();
                return Expanded(
                  child: filteredProperties.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.faceFrown,
                                  size: 35,
                                  color: AppThemeData.themeColorShade),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "No properties found\n",
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    color: AppThemeData.themeColorShade),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: filteredProperties.length,
                                  itemBuilder: (context, index) {
                                    final prop = filteredProperties[index];
                                    final propData =
                                        prop.data() as Map<String, dynamic>;

                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => PropertiesDetailsPage(
                                                  propData: propData,
                                                  propId: prop.id,
                                                ),
                                            transition:
                                                Transition.rightToLeftWithFade);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        //height: 500,
                                        //width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                          color: AppThemeData.background,
                                          border: Border.all(
                                              color: AppThemeData.themeColor,
                                              width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
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
                                            ImageAllProp(
                                              imgUrl:
                                                  propData["imageUrls"].first,
                                            ),
                                            CategoryText(
                                              category: propData['category'],
                                              type: propData['type'],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TitleAllProp(
                                                    title: propData["title"],
                                                  ),
                                                  SaveIconAllProp(
                                                    propId: prop.id,
                                                    isSaved: propData[
                                                            'propertySaved']
                                                        .contains(auth
                                                            .currentUser!.uid),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  PriceAllProp(
                                                    price: propData["price"],
                                                  ),
                                                  propData["category"] == "Land"
                                                      ? PlotAreaAllProp(
                                                          plotArea: propData[
                                                              "plotArea"],
                                                        )
                                                      : AreaSQ2(
                                                          areaSQ2: propData[
                                                              "areaftsq"]),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 35),
                                              child: propData["category"] ==
                                                      "Land"
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        LandLengthBreadth(
                                                          type: "Length :",
                                                          value: propData[
                                                              "length"],
                                                        ),
                                                        LandLengthBreadth(
                                                          type: "Breadth :",
                                                          value: propData[
                                                              "breadth"],
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        CountsOfItems(
                                                          items: propData[
                                                              "bedrooms"],
                                                          icon: Icons
                                                              .bed_outlined,
                                                        ),
                                                        CountsOfItems(
                                                          items: propData[
                                                              "bathrooms"],
                                                          icon: Icons
                                                              .bathtub_outlined,
                                                        ),
                                                        CountsOfItems(
                                                          items: propData[
                                                              "floors"],
                                                          icon: Icons.layers,
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                            LocationAllProp(
                                              location: propData["location"],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                );
              }),
        ],
      ),
    );
  }
}
