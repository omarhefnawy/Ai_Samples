import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? title;
  final String? description;
  final String? pubDate;
  final String? imageUrl;
  final String? source_name;
  final String? link;
  // Constructor for Entity
  ArticleEntity({
    required this.title,
    required this.description,
    required this.pubDate,
    required this.imageUrl,
    required this.source_name,
    required this.link,
  });
  @override
  List<Object?> get props =>
      [title, description, pubDate, imageUrl, source_name, link];
}
