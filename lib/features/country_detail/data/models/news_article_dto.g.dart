// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseDto _$NewsResponseDtoFromJson(Map<String, dynamic> json) =>
    NewsResponseDto(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

NewsArticleDto _$NewsArticleDtoFromJson(Map<String, dynamic> json) =>
    NewsArticleDto(
      title: json['title'] as String,
      url: json['url'] as String,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      source: json['source'] == null
          ? null
          : NewsSourceDto.fromJson(json['source'] as Map<String, dynamic>),
      publishedAt: json['publishedAt'] as String?,
    );

NewsSourceDto _$NewsSourceDtoFromJson(Map<String, dynamic> json) =>
    NewsSourceDto(name: json['name'] as String?);
