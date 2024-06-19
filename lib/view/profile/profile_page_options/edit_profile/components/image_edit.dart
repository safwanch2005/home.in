import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class ProfileImageEdit extends StatefulWidget {
  const ProfileImageEdit({super.key});

  @override
  State<ProfileImageEdit> createState() => _ProfileImageEditState();
}

class _ProfileImageEditState extends State<ProfileImageEdit> {
  File? _image;

  final ctrl = Get.put(AuthController());

  _selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await _cropImage(File(pickedFile.path)) as File;
      _image = croppedFile;
      await ctrl.uploadImageToFirebase(croppedFile);
      setState(() {});
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
          toolbarColor: AppThemeData.background,
          toolbarWidgetColor: AppThemeData.themeColor,
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
    return Stack(
      children: [
        _image == null
            ? CircleAvatar(
                radius: 60,
                backgroundImage: ctrl.imgUrl == null
                    ? const AssetImage(
                        "assets/profile.jpeg",
                      ) as ImageProvider
                    : NetworkImage(ctrl.imgUrl!),
              )
            : CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(_image!),
              ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await _selectAndUploadImage();
            },
          ),
        ),
      ],
    );
  }
}
