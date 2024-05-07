import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/custom_select_option_form.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/add_image.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/area_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/breadth_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/description_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/facing_dropdown.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/length_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/location/location_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/location/selected_location.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/plot_area._field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/price_field.dart';
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/title_field.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class FormPage extends StatefulWidget {
  FormPage({super.key, required this.isLand});
  bool isLand;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final propCtrl = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.black,
      appBar: AppBar(
        backgroundColor: AppThemeData.black,
        foregroundColor: AppThemeData.white,
        title: Text(
          propCtrl.category,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            // vertical: MediaQuery.of(context).size.height * 0.05,
            horizontal: MediaQuery.of(context).size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSelectOptionForm(
                    text: "Type",
                    options: const [
                      "For sale",
                      "For rent",
                    ],
                  ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "Furnishing",
                          options: const [
                            'Fully Furnished',
                            'Semi-Furnished',
                            'Unfurnished',
                            'Partially Furnished',
                          ],
                        ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "Construction Status",
                          options: const [
                            "New Launch",
                            "Ready to Move",
                            "Under Construction",
                          ],
                        ),
                  CustomSelectOptionForm(
                    text: "Listed by",
                    options: const [
                      "Dealer",
                      "Owner",
                    ],
                  ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "Car parking",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "No. of Bedrooms",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand ? PlotAreaField() : const SizedBox(),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "No. of Bathrooms",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          text: "No. of floors",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  FacingDropDown(),
                  widget.isLand ? LengthField() : AreaTextField(),
                  widget.isLand ? BreadthField() : const SizedBox(),
                  TitleField(),
                  DescriptionField(),
                  PriceField(),
                  LocationField(),
                  SelectedLocation(),
                  const AddImage(),
                  // propCtrl.imageUrls.isEmpty
                  //     ? Text(
                  //         "Is Empty....",
                  //         style: GoogleFonts.poppins(fontSize: 30),
                  //       )
                  //     : Image(image: NetworkImage(propCtrl.imageUrls.last)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    alignment: Alignment.center,
                    child: Obx(
                      () => SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: propCtrl.isLoading.value
                            ? CircularProgressIndicator(
                                color: AppThemeData.white,
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppThemeData.white),
                                child: Text(
                                  "Upload",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30, color: AppThemeData.black),
                                ),
                                onPressed: () {
                                  propCtrl.addPropertyDetails(
                                    category: propCtrl.category,
                                    type: propCtrl.type,
                                    title: propCtrl.title.text,
                                    description: propCtrl.description.text,
                                    price: propCtrl.price.text,
                                    location: propCtrl.location,
                                    imageUrls: propCtrl.imageUrls,
                                    listedBy: propCtrl.listedBy,
                                    facingDirection: propCtrl.facingDirection,
                                    length: propCtrl.length.text,
                                    breadth: propCtrl.breadth.text,
                                    areaftsq: propCtrl.areaftsq.text,
                                    bathrooms: propCtrl.bathrooms,
                                    bedrooms: propCtrl.bedrooms,
                                    carParking: propCtrl.carParking,
                                    constructionStatus:
                                        propCtrl.constructionStatus,
                                    furnishing: propCtrl.furnishing,
                                    floors: propCtrl.floors,
                                    plotArea: propCtrl.plotArea.text,
                                    postedBy: auth.currentUser!.displayName!,
                                    postedFrom: auth.currentUser!.phoneNumber ??
                                        auth.currentUser!.email ??
                                        "",

                                    // postedFrom: auth.currentUser.phoneNumber == ""?auth.currentUser!.email : auth.currentUser.phoneNumber
                                  );
                                }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    propCtrl.type = "";
    propCtrl.title.clear();
    propCtrl.description.clear();
    propCtrl.price.clear();
    propCtrl.location["country"] = "";
    propCtrl.location["state"] = "";
    propCtrl.location["city"] = "";
    propCtrl.imageUrls.clear();
    propCtrl.listedBy = "";
    propCtrl.facingDirection = "select direction";
    propCtrl.length.clear();
    propCtrl.breadth.clear();
    propCtrl.areaftsq.clear();
    propCtrl.bathrooms = "";
    propCtrl.bedrooms = "";
    propCtrl.carParking = "";
    propCtrl.constructionStatus = "";
    propCtrl.furnishing = "";
    propCtrl.floors = "";
    propCtrl.plotArea.clear();
    propCtrl.postedBy = "";
    propCtrl.postedFrom = "";

    super.dispose();
  }
}
