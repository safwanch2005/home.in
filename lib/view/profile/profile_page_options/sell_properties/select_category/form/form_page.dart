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
import 'package:real_estate_application/view/profile/profile_page_options/sell_properties/select_category/form/form_components/edit_image.dart';
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
  final isEditMode = PropertyController.editMode;
  final data = PropertyController.dataForEdit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      appBar: AppBar(
        backgroundColor: AppThemeData.background,
        foregroundColor: AppThemeData.themeColor,
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
            horizontal: MediaQuery.of(context).size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSelectOptionForm(
                    data: propCtrl.type,
                    text: "Type",
                    options: const [
                      "For sale",
                      "For rent",
                    ],
                  ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          data: propCtrl.furnishing,
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
                          data: propCtrl.constructionStatus,
                          text: "Construction Status",
                          options: const [
                            "New Launch",
                            "Ready to Move",
                            "Under Construction",
                          ],
                        ),
                  CustomSelectOptionForm(
                    data: propCtrl.listedBy,
                    text: "Listed by",
                    options: const [
                      "Dealer",
                      "Owner",
                    ],
                  ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          data: propCtrl.carParking,
                          text: "Car parking",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          data: propCtrl.bedrooms,
                          text: "No. of Bedrooms",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand ? PlotAreaField() : const SizedBox(),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          data: propCtrl.bathrooms,
                          text: "No. of Bathrooms",
                          options: const ["0", "1", "2", "3+"],
                        ),
                  widget.isLand
                      ? const SizedBox()
                      : CustomSelectOptionForm(
                          data: propCtrl.floors,
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
                  PropertyController.editMode
                      ? const EditImage()
                      : const AddImage(),
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
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppThemeData.themeColor,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: AppThemeData.background,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppThemeData.themeColor
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 8, // Blur radius
                                      offset: const Offset(0, 0), // Offset
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppThemeData.background),
                                    child: Text(
                                      "Upload",
                                      style: GoogleFonts.poppins(
                                          fontSize: 30,
                                          color: AppThemeData.themeColor),
                                    ),
                                    onPressed: () {
                                      PropertyController.editMode
                                          ? propCtrl.editProperty()
                                          : propCtrl.addPropertyDetails(
                                              category: propCtrl.category,
                                              type: propCtrl.type,
                                              title: propCtrl.title.text,
                                              description:
                                                  propCtrl.description.text,
                                              price: propCtrl.price.text,
                                              location: propCtrl.location,
                                              imageUrls: propCtrl.imageUrls,
                                              listedBy: propCtrl.listedBy,
                                              facingDirection:
                                                  propCtrl.facingDirection,
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
                                              propertySaved:
                                                  propCtrl.propertySaved,
                                              postedBy: auth
                                                  .currentUser!.displayName!,
                                              postedFrom: auth.currentUser!
                                                      .phoneNumber ??
                                                  auth.currentUser!.email ??
                                                  "",
                                            );
                                    }),
                              ),
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
    propCtrl.type = null;
    propCtrl.title.clear();
    propCtrl.description.clear();
    propCtrl.price.clear();
    propCtrl.location["country"] = "";
    propCtrl.location["state"] = "";
    propCtrl.location["city"] = "";
    propCtrl.imageUrls.clear();
    propCtrl.listedBy = null;
    propCtrl.facingDirection = "select direction";
    propCtrl.length.clear();
    propCtrl.breadth.clear();
    propCtrl.areaftsq.clear();
    propCtrl.bathrooms = null;
    propCtrl.bedrooms = null;
    propCtrl.carParking = null;
    propCtrl.constructionStatus = null;
    propCtrl.furnishing = null;
    propCtrl.floors = null;
    propCtrl.plotArea.clear();
    propCtrl.postedBy = "";
    propCtrl.postedFrom = "";
    propCtrl.propertySaved.clear();
    PropertyController.editMode = false;
    PropertyController.propertyId = null;
    super.dispose();
  }
}
