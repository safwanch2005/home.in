import 'package:flutter/material.dart';
import 'package:real_estate_application/view/properties_detail_page/components/back_and_share_icon.dart';
import 'package:real_estate_application/view/properties_detail_page/components/count_of_items.dart';
import 'package:real_estate_application/view/properties_detail_page/components/description.dart';
import 'package:real_estate_application/view/properties_detail_page/components/details_container.dart';
import 'package:real_estate_application/view/properties_detail_page/components/land_details_container.dart';
import 'package:real_estate_application/view/properties_detail_page/components/land_length_breadth.dart';
import 'package:real_estate_application/view/properties_detail_page/components/location_text.dart';
import 'package:real_estate_application/view/properties_detail_page/components/posted_time.dart';
import 'package:real_estate_application/view/properties_detail_page/components/price.dart';
import 'package:real_estate_application/view/properties_detail_page/components/property_image.dart';
import 'package:real_estate_application/view/properties_detail_page/components/title.dart';
import 'package:real_estate_application/view/properties_detail_page/components/user_profile.dart';

// ignore: must_be_immutable
class PropertiesDetailsPage extends StatelessWidget {
  PropertiesDetailsPage({super.key, required this.propData});
  Map<String, dynamic> propData = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  PropertyImage(
                    imageUrls: propData["imageUrls"],
                  ),
                  const BackAndShareIcon(),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 305,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PriceDetailPage(price: propData['price']),
                            const PostedTime(),
                          ],
                        ),
                        TitleDetailPage(title: propData['title']),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              propData["category"] == "Land"
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        LandLengthBreadthAllDetailPage(
                                          type: "Length :",
                                          value: propData["length"],
                                        ),
                                        LandLengthBreadthAllDetailPage(
                                          type: "Breadth :",
                                          value: propData["breadth"],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CountsOfItemsAllDetailPage(
                                          items: propData["bedrooms"],
                                          icon: Icons.bed_outlined,
                                        ),
                                        CountsOfItemsAllDetailPage(
                                          items: propData["bathrooms"],
                                          icon: Icons.bathtub_outlined,
                                        ),
                                        CountsOfItemsAllDetailPage(
                                          items: propData["floors"],
                                          icon: Icons.layers,
                                        ),
                                      ],
                                    ),
                              LocationTextDetailPage(
                                  location: propData["location"]),
                            ],
                          ),
                        ),
                        propData["category"] == "Land"
                            ? LandDetailsContainer(
                                propData: propData,
                              )
                            : DetailsContainerHouseApart(
                                propData: propData,
                              ),
                        DescriptionPageDetailPage(
                          description: propData['description'],
                        ),
                        UserProfileDetailsPage(propData: propData),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
