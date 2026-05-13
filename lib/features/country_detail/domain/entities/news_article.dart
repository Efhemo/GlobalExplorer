import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable {
  const NewsArticle({
    required this.title,
    required this.url,
    this.description,
    this.urlToImage,
    this.sourceName,
    this.publishedAt,
  });

  final String title;
  final String url;
  final String? description;
  final String? urlToImage;
  final String? sourceName;
  final DateTime? publishedAt;

  @override
  List<Object?> get props => [url];
}
