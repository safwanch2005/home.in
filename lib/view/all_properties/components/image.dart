import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageAllProp extends StatelessWidget {
  ImageAllProp({super.key, required this.imgUrl});
  String imgUrl = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 318,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imgUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
