import 'package:ai_sample/core/shared/launch.dart';
import 'package:ai_sample/core/shared/navigate.dart';
import 'package:ai_sample/features/chat_boot/presentation/chat_boot.dart';
import 'package:ai_sample/features/tec_articles/domain/entities/tech_article.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleInfo extends StatelessWidget {
  final ArticleEntity articles;
  ArticleInfo({
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        title: Text(
          '${articles.title}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextButton.icon(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueGrey[900],
      ),
      body: (articles.title!.isNotEmpty && articles.title != null)
          ? _buildArticleCard(articles, context)
          : const Center(
              child: Text(
                'No Articles Available',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }

  Widget _buildArticleCard(ArticleEntity article, BuildContext context) {
    return ListView(children: [
      Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildImage(article.imageUrl.toString()),
              const SizedBox(
                height: 20,
              ),
              _buildArticleDetails(article),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildImage(String image) {
    return Image.network(
      image ??
          'https://www.industryconnect.org/wp-content/uploads/2018/10/nztech.jpg',
      fit: BoxFit.contain,
      height: 200,
      width: 450,
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
        ),
        const SizedBox(height: 5),
        Text(
          article.description ?? 'No Description',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            TextButton(
              child: const Text('More Information'),
              onPressed: () {
                launchURL(article.link ?? '');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              article.source_name ?? 'Unknown Source',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              article.pubDate ?? 'No Date',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
