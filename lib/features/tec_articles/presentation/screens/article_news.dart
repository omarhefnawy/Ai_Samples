import 'dart:math';

import 'package:ai_sample/core/shared/navigate.dart';
import 'package:ai_sample/features/auth/presentation/screens/login.dart';
import 'package:ai_sample/features/chat_boot/presentation/chat_boot.dart';
import 'package:ai_sample/features/tec_articles/domain/entities/tech_article.dart';
import 'package:ai_sample/features/tec_articles/presentation/screens/about_app.dart';
import 'package:ai_sample/features/tec_articles/presentation/screens/article_info.dart';
import 'package:ai_sample/features/tec_articles/presentation/screens/contact_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class TechNewsScreen extends StatelessWidget {
  final List<ArticleEntity> articles;

  TechNewsScreen({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Tech News',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          const SizedBox(
            width: 5,
          ),
          TextButton.icon(
            onPressed: () {
              navigate(context: context, screen: ChatBoot());
            },
            icon: const Icon(
              FontAwesomeIcons.commentDots, // Chat icon
              color: Colors.white,
            ),
            label: const Text(
              ' Gemini Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
          // IconButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     navigateWithoutBack(
          //         context: context, screen: LoginScreen(articles));
          //   },
          //   icon: const Icon(
          //     FontAwesomeIcons.signOut,
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(width: 10),
        ],
        backgroundColor: Colors.blueGrey[900],
      ),
      drawer: Drawer(
        width: 180,
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                child: const Text(
                  'Tech News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.contactCard),
              //Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Navigate to the Contact Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.signOut,
              ),
              title: const Text('Log Out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                navigateWithoutBack(
                  context: context,
                  screen: LoginScreen(articles),
                );
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.circleInfo,
              ),
              title: const Text(
                'About',
              ),
              onTap: () {
                // Navigate to the About App Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: articles.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: articles.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final article = articles[index];
                return _buildArticleCard(article, index, context);
              },
            )
          : const Center(
              child: Text(
                'No Articles Available',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }

  Widget _buildArticleCard(
      ArticleEntity article, int index, BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          navigate(
            context: context,
            screen: ArticleInfo(
              articles: article,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildImage(article.imageUrl.toString()),
              const SizedBox(width: 10),
              Expanded(
                child: _buildArticleDetails(article),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String image) {
    return Image.network(
      image ??
          'https://www.industryconnect.org/wp-content/uploads/2018/10/nztech.jpg',
      fit: BoxFit.cover,
      height: 100,
      width: 100,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(size: 40, Icons.error);
      },
    );
  }

  Widget _buildArticleDetails(ArticleEntity article) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title ?? 'No Title',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Text(
          article.description ?? 'No Description',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              article.source_name ?? 'Unknown Source',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              article.pubDate ?? 'No Date',
              style: const TextStyle(
                fontSize: 9,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
