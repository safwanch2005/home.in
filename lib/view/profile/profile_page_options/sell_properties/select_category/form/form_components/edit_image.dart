import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class EditImage extends StatefulWidget {
  const EditImage({super.key});

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  PropertyController ctrl = Get.find();
  final List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Divider(color: AppThemeData.themeColor),
        const SizedBox(height: 15),
        Align(
          child: Text(
            "Edit photos (min 4)",
            style: GoogleFonts.poppins(
                fontSize: 25, color: AppThemeData.themeColor),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                for (int i = 0; i < (ctrl.imageUrls.length); i++)
                  GestureDetector(
                    onTap: () {
                      removeImage(i);
                    },
                    child: ImageContainer(
                      image: ctrl.imageUrls[i],
                    ),
                  ),
                InkWell(
                  onTap: () async {
                    await selectAndUploadImage();
                  },
                  child: const ImageContainer(
                    icon: FontAwesomeIcons.plus,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ],
    );
  }

  selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await cropImage(File(pickedFile.path)) as File;
      images.add(croppedFile);
      await ctrl.uploadImageToFirebase(croppedFile);
      setState(() {});
    } else {
      Get.snackbar("Error", "Image not selected",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio7x5,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Image",
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.amber,
        )
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return imageFile;
    }
  }

  removeImage(int i) {
    try {
      ctrl.imageUrls.removeAt(i);
      //_images.remove(_images[i]);
      Get.snackbar("", "Image ${i + 1} removed",
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);

      setState(() {});
    } catch (e) {
      Get.snackbar(
          "error", "Error in removing image,try again after few seconds",
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class ImageContainer extends StatelessWidget {
  final String? image;
  final IconData? icon;
  const ImageContainer({super.key, this.image, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: 80,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppThemeData.themeColor, width: 1),
        color: AppThemeData.background,
      ),
      child: Center(
        child: image != null
            ? Stack(
                children: [
                  Center(
                    child: Image.network(
                      image.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              )
            : FaIcon(
                icon ?? FontAwesomeIcons.fileImage,
                color: AppThemeData.themeColor,
              ),
      ),
    );
  }
}
