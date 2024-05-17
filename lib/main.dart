import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/view/authentication/authentication_page.dart';
import 'package:real_estate_application/view/bottom_nav/bottom_navbar.dart';
import 'firebase/firebase_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization;
  Get.config(enableLog: false);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return BottomNavBar();
            } else {
              return const AuthenticationPage();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
