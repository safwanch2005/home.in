import 'package:flutter/material.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationPage(),
    );
  }
}
