import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_application/view/theme/theme_data.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(
            color: AppThemeData.themeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Welcome to Home.in, a mobile application developed using Flutter with Firebase as the backend (the "Service"). This Privacy Policy explains how we collect, use, and disclose your information when you use our Service. By using the Service, you agree to the collection and use of information in accordance with this policy.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Information We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'When you use our Service, we may ask you to provide certain personally identifiable information, including but not limited to:\n'
              '- Name\n'
              '- Email address\n'
              '- Phone number\n'
              '- Profile picture\n'
              '- Authentication details (phone number, email-password)\n'
              '- Location data (only if you allow location permission)',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Property Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Users can post properties which include details such as:\n'
              '- Property type (house, apartment, land, etc.)\n'
              '- Sale or rent status\n'
              '- Ownership details (owner or dealer)\n'
              '- Property description\n'
              '- Images (minimum of 4 per property)',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Usage Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We may collect information on how the Service is accessed and used, including but not limited to:\n'
              '- Chat messages and images exchanged between users\n'
              '- Notifications received and interaction with them\n'
              '- Properties added to favorites\n'
              '- Search queries and filters used',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'How We Use Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- To facilitate the creation of your user account and secure authentication.\n'
              '- To allow you to post properties and manage your listings.\n'
              '- To enable communication between users via chat.\n'
              '- To send notifications regarding new messages, property approvals, and other updates.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Property Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- To display properties to other users after admin approval.\n'
              '- To help users find properties by category, recent listings, and nearby properties using location data.\n'
              '- To improve our search functionality and filtering options.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Usage Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- To monitor and analyze the usage of the Service for improvements.\n'
              '- To provide and maintain the functionality of the Service.\n'
              '- To detect, prevent, and address technical issues.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sharing Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We do not share your personal information with third parties except in the following cases:\n'
              '- With your consent.\n'
              '- To comply with legal obligations.\n'
              '- To protect and defend our rights and property.\n'
              '- To prevent or investigate possible wrongdoing in connection with the Service.\n'
              '- To protect the personal safety of users of the Service or the public.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Data Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We take the security of your data seriously and use commercially acceptable means to protect your personal information. However, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee its absolute security.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Data Encryption',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'All sensitive customer information, including physical addresses, email addresses, and any potential credit information, is encrypted both at rest and in transit. We use AES-256 encryption for data at rest and TLS 1.2 or higher for data in transit.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Secure Authentication',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Our application utilizes Firebase Authentication, which supports secure methods such as email/password and phone authentication. This ensures that user authentication is handled securely.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Database Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We use Firebase Firestore, a secure database service provided by Google Cloud. Firestore offers robust security features, including role-based access control (RBAC), to ensure that only authorized users can access specific data.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Third-Party Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'We leverage Firebase\'s secure data storage services, which comply with industry standards and certifications, including ISO 27001, SOC 1, SOC 2, and SOC 3. This ensures that customer data is stored securely and handled in accordance with best practices.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Regular Security Audits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Our application undergoes regular security audits and assessments to identify and address potential vulnerabilities. This proactive approach helps us maintain a high level of security for our users.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Your Data Protection Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Depending on your location, you may have the following rights regarding your personal information:\n'
              '- The right to access – You have the right to request copies of your personal data.\n'
              '- The right to rectification – You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.',
            ),
            const SizedBox(height: 16.0),
            Text(
              'Contact Us\n'
              'Name: Safwan CH\n'
              'Email: safwan55550000@gmail.com\n',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
