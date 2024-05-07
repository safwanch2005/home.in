import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final List<File> _images = [];
  PropertyController ctrl = Get.find();

  _selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await _cropImage(File(pickedFile.path)) as File;

      setState(() {
        _images.add(croppedFile);
        ctrl.uploadImageToFirebase(croppedFile);
      });
    } else {
      Get.snackbar("Error", "Image not selected",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  _cropImage(File imageFile) async {
    //File croppedFile =
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio7x5,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Image",
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
        )
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return imageFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(height: 15),
        Align(
          child: Text(
            "Add photos (min 4)",
            style: GoogleFonts.poppins(fontSize: 25, color: AppThemeData.white),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 15),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // for (var image in _images)
                for (int i = 0; i < _images.length; i++)
                  GestureDetector(
                      onTap: () async {
                        removeImage(i);
                      },
                      child: ImageContainer(image: _images[i])),
                //if (_images.length < 4)
                InkWell(
                  onLongPress: () {},
                  onTap: () async {
                    await _selectAndUploadImage();
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
        const Divider(),
      ],
    );
  }

  removeImage(int i) {
    try {
      ctrl.imageUrls.removeAt(i);
      _images.remove(_images[i]);
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
  final File? image;
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
        border: Border.all(color: AppThemeData.grey, width: 1),
        color: AppThemeData.black,
      ),
      child: Center(
        child: image != null
            ? Stack(
                children: [
                  Center(
                    child: Image.file(
                      image!,
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
                color: AppThemeData.white,
              ),
      ),
    );
  }
}
