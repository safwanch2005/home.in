import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/controller/propertycontroller.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

// ignore: must_be_immutable
class FacingDropDown extends StatelessWidget {
  final List<String> directions = [
    'North',
    'North-East',
    'East',
    'South-East',
    'South',
    'South-West',
    'West',
    'North-West'
  ];
  final TextEditingController _textController = TextEditingController();
  String? selectedDirection;

  FacingDropDown({super.key});
  PropertyController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'Facing',
          style: GoogleFonts.poppins(fontSize: 25, color: AppThemeData.white),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: GoogleFonts.poppins(fontSize: 20),
                controller: _textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: ' ${ctrl.facingDirection}',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 23, color: AppThemeData.black),
                  suffixIcon: const Icon(Icons.arrow_drop_down, size: 30),
                ),
                readOnly: true,
                onTap: () {
                  _showDirectionDropdown(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDirectionDropdown(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppThemeData.grey,
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            itemCount: directions.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  directions[index],
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: AppThemeData.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _textController.text = directions[index];
                  selectedDirection = directions[index];
                  ctrl.facingDirection = selectedDirection.toString();
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }
}
