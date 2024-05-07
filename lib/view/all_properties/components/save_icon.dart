import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SaveIconAllProp extends StatelessWidget {
  const SaveIconAllProp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FaIcon(
      FontAwesomeIcons.heart,
      color: Colors.white70,
      size: 30,
    );
  }
}
