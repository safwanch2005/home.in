import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/chatcontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/chat/chatting_screen/chatting_screen.dart';
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
import 'package:real_estate_application/view/properties_detail_page/components/save_and_message_button/save_and_message_button.dart';
import 'package:real_estate_application/view/properties_detail_page/components/title.dart';
import 'package:real_estate_application/view/properties_detail_page/components/user_profile.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class PropertiesDetailsPage extends StatelessWidget {
  PropertiesDetailsPage(
      {super.key, required this.propData, required this.propId});
  Map<String, dynamic> propData;
  dynamic propId;
  double initialX = 0.0;
  double finalX = 0.0;
  final chatCtrl = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          initialX = details.localPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          finalX = details.localPosition.dx;
        },
        onHorizontalDragEnd: (details) async {
          if (finalX - initialX > 0) {
            Get.back();
          } else {
            if (propData['userId'] != auth.currentUser!.uid) {
              chatCtrl.friendId = propData["userId"];
              chatCtrl.friendName = propData["postedBy"];
              await chatCtrl.getChatId();
              Get.to(
                () => const ChattingScreen(),
                transition: Transition.rightToLeft,
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: AppThemeData.black12,
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
                      decoration: BoxDecoration(
                        color: AppThemeData.background,
                        borderRadius: const BorderRadius.only(
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
                            decoration: BoxDecoration(
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
                              ? LandDetailsContainer(propData: propData)
                              : DetailsContainerHouseApart(propData: propData),
                          DescriptionPageDetailPage(
                              description: propData['description']),
                          UserProfileDetailsPage(propData: propData),
                          const SizedBox(height: 30),
                          SaveAndMessageButton(
                            propId: propId,
                            isSaved: propData['propertySaved']
                                .contains(auth.currentUser!.uid),
                            propData: propData,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
