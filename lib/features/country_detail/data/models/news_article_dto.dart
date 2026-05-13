import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/news_article.dart';

part 'news_article_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class NewsResponseDto {
  const NewsResponseDto({required this.articles});

  final List<NewsArticleDto> articles;

  factory NewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class NewsArticleDto {
  const NewsArticleDto({
    required this.title,
    required this.url,
    this.description,
    this.urlToImage,
    this.source,
    this.publishedAt,
  });

  final String title;
  final String url;
  final String? description;
  final String? urlToImage;
  final NewsSourceDto? source;
  final String? publishedAt;

  factory NewsArticleDto.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleDtoFromJson(json);

  NewsArticle toDomain() => NewsArticle(
        title: title,
        url: url,
        description: description,
        urlToImage: urlToImage,
        sourceName: source?.name,
        publishedAt:
            publishedAt != null ? DateTime.tryParse(publishedAt!) : null,
      );
}

@JsonSerializable(createToJson: false)
class NewsSourceDto {
  const NewsSourceDto({this.name});

  final String? name;

  factory NewsSourceDto.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceDtoFromJson(json);
}
