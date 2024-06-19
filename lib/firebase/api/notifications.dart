import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart';
import 'package:real_estate_application/controller/authcontroller.dart';
import 'package:real_estate_application/firebase/api/json_string.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/error.dart';
import 'package:real_estate_application/view/custom_widget/snackbar/success.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final ctrl = Get.put(AuthController());
  String title = 'Home.in';

  initNotifications() async {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      });
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      ctrl.notificationToken = await _firebaseMessaging.getToken();
    } catch (e) {
      errorSnackBar('Error', e.toString());
    }
  }

  Future<String> getAccessToken() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(jsonString);

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final authClient =
        await clientViaServiceAccount(accountCredentials, scopes);
    final accessToken = (authClient.credentials).accessToken.data;

    return accessToken;
  }

  pushNotification({
    required String friendToken,
  }) async {
    String body = 'You have a new message';
    try {
      final accessToken = await getAccessToken();
      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/real-estate-application-88118/messages:send'), // Update with your project ID
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          'message': {
            'token': friendToken,
            'notification': {
              'title': 'Home.in',
              'body': body,
            },
          }
        }),
      );
      if (response.statusCode != 200) {
        print('Failed to send notification: ${response.statusCode}');
        print('Response body: ${response.body}');
        errorSnackBar('Error', 'Failed to send notification');
      } else {
        successSnackbar('Done', 'Notification sent successfully');
      }
    } catch (e) {
      errorSnackBar('Error', e.toString());
    }
  }
}
