import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/indexcontroller.dart';
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
import 'package:real_estate_application/view/all_properties/components/prop_not_found.dart';
import 'package:real_estate_application/view/all_properties/components/save_icon.dart';
import 'package:real_estate_application/view/all_properties/components/title.dart';
import 'package:real_estate_application/view/all_properties/filter_properties/filter_properties_page.dart';
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
  final indexCtrl = Get.put(IndexController());

  Future<void> onRefresh() async {
    setState(() {});
    return await Future.delayed(const Duration(milliseconds: 500));
  }

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
              autofocus: indexCtrl.fromHomeTextField,
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
          FilterPropertiesPage(),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.refresh, color: AppThemeData.themeColor)],
              ),
            ),
          ),

          StreamBuilder<QuerySnapshot>(
              stream: ctrl.getAllProperties(),
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
                var filteredProperties = propertiesDocs.where((prop) {
                  final propData = prop.data() as Map<String, dynamic>;
                  final title = propData['title'].toString().toLowerCase();
                  return title.contains(searchData);
                }).toList();
                if (ctrl.startingRange != null && ctrl.endingRange != null) {
                  filteredProperties = filteredProperties.where((prop) {
                    final propData = prop.data() as Map<String, dynamic>;
                    final price = int.parse(propData['price']);
                    return price >= ctrl.startingRange! &&
                        price <= ctrl.endingRange!;
                  }).toList();
                }
                if (ctrl.lowToHighPriceFilter != null) {
                  filteredProperties.sort((a, b) {
                    final priceA =
                        int.parse((a.data() as Map<String, dynamic>)['price']);
                    final priceB =
                        int.parse((b.data() as Map<String, dynamic>)['price']);

                    return ctrl.lowToHighPriceFilter!
                        ? priceA.compareTo(priceB)
                        : priceB.compareTo(priceA);
                  });
                }
                return Expanded(
                  child: filteredProperties.isEmpty
                      ? GestureDetector(
                          onTap: () => setState(() {}),
                          child: propNotFound(),
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
                                              isSold: propData['isSold'],
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
          // ),
        ],
      ),
    );
  }
}
