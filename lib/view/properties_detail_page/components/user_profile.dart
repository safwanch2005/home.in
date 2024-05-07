import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserProfileDetailsPage extends StatelessWidget {
  UserProfileDetailsPage({super.key, required this.propData});
  dynamic propData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 5),
          child: Text(
            "Posted by",
            style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: double.infinity,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white12,
                  backgroundImage: AssetImage(
                    "assets/profile.jpeg",
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                propData["postedBy"],
                style: GoogleFonts.poppins(fontSize: 30, color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
