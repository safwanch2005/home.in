import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/firebase/firebase_constants.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/delete.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/edit.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/image.dart';
import 'package:real_estate_application/view/profile/profile_page_options/my_properties/components/tittle.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class MyPropertiesPage extends StatelessWidget {
  const MyPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.black,
      appBar: AppBar(
        backgroundColor: AppThemeData.black,
        foregroundColor: AppThemeData.white,
        title: Text(
          "My properties",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('properties')
              .where('userId', isEqualTo: auth.currentUser!.uid)
              .snapshots(),
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

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: propertiesDocs.length,
                itemBuilder: (context, index) {
                  final prop = propertiesDocs[index];
                  final propData = prop.data() as Map<String, dynamic>;
                  print(propData);
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => PropertiesDetailsPage(
                            propData: propData,
                          ));
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        // height: 500,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            //  color: Colors.white30,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            PropImageMyProp(
                              imgUrl: propData["imageUrls"].first,
                            ),
                            TittleMyProp(title: propData['title']),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const EditMyProp(),
                                DeleteMyProp(
                                  id: prop.id,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
