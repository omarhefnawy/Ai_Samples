import 'package:ai_sample/core/shared/launch.dart';
import 'package:ai_sample/core/shared/navigate.dart';
import 'package:ai_sample/features/tec_articles/presentation/screens/contact_page.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  AboutApp({super.key});
  List<String> title = [
    'App Name',
    'Description',
    'Features',
    'Technologies Used',
    'Developed by',
    'Version',
    'Source Code',
  ];
  List<String> desc = [
    'Tech News',
    'This app is designed for technology enthusiasts who want to stay updated with the latest tech news and interact with an AI-powered chatbot. It offers news articles, chatbot interactions, and image descriptions, creating an engaging and informative user experience.',
    '- Browse the latest tech articles.\n- Engage with a chatbot for instant answers and image descriptions.\n- Easy authentication via Firebase.\n',
    'Flutter\nFirebase\nDio\nShared Preferences',
    '- Ashraf Abdo\n- Omar Hefnawy',
    '1.0.0',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'About Info',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => buildCard(
            context: context,
            title: Text(
              title[index],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            desc: Text(
              desc[index],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            isLink: (index == 4),
            isSource: (index == 6),
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemCount: title.length,
        ),
      ),
    );
  }

  Widget buildCard(
      {required Text title,
      required Text desc,
      bool isLink = false,
      bool isSource = false,
      required context}) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLink
            ? Column(
                children: [
                  title,
                  const SizedBox(
                    height: 10,
                  ),
                  desc,
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      navigate(context: context, screen: const ContactPage());
                    },
                    child: const Text(
                      'Contact US',
                    ),
                  ),
                ],
              )
            : isSource
                ? Column(
                    children: [
                      title,
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          launchURL(
                              'https://github.com/omarhefnawy/Gemini_app');
                        },
                        child: const Text(
                          'Link',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      title,
                      const SizedBox(
                        height: 10,
                      ),
                      desc,
                    ],
                  ),
      ),
    );
  }
}
