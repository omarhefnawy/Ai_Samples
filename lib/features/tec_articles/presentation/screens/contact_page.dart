import 'package:ai_sample/core/shared/launch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We would love to hear from you! Feel free to contact us for any inquiries, suggestions, or feedback.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 30),

            // Email Section
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.blue,
                size: 32,
              ),
              title: const Text(
                'Follow Us on LinkedIn',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('ashraf abdo'),
              onTap: () {
                launchURL(
                  'https://www.linkedin.com/in/ashraf-abdo/',
                ); // Launches email client
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.blue,
                size: 32,
              ),
              title: const Text(
                'Follow Us on LinkedIn',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('omar hefnawy'),
              onTap: () {
                launchURL(
                  'https://www.linkedin.com/in/omar-hefnawy-3a196b238/',
                ); // Launches email client
              },
            ),
            const Divider(),

            // Phone Section
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.squarePhone,
                color: Colors.green,
                size: 32,
              ),
              title: const Text(
                'Call Ashraf',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                '+20 1094994534',
              ), // Replace with your app's contact phone number
              onTap: () {
                launchURL('tel:+201094994534'); // Launches phone dialer
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.squarePhone,
                color: Colors.green,
                size: 32,
              ),
              title: const Text(
                'Call Omar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                '+20 1552781233',
              ), // Replace with your app's contact phone number
              onTap: () {
                launchURL('tel:+2 01552781233'); // Launches phone dialer
              },
            ),
            const Divider(),

            // Website Section
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.squareFacebook,
                color: Colors.blue,
                size: 32,
              ),
              title: const Text(
                'Follow Us on Facebook',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                launchURL(
                    'https://www.facebook.com/profile.php?id=100026389156602'); // Launches web browser
              },
            ),
            const Divider(),

            // Social Media Section (Example: email)
            ListTile(
              leading: const Icon(
                Icons.mail_outline,
                size: 32,
              ),
              title: const Text(
                'Email Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                launchURL('mailto:omarhefhef90@gmail.com'); // Opens Twitter
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
