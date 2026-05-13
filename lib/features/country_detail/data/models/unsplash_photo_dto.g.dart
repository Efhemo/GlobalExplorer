// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashSearchResponseDto _$UnsplashSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => UnsplashSearchResponseDto(
  results: (json['results'] as List<dynamic>)
      .map((e) => UnsplashPhotoDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

UnsplashPhotoDto _$UnsplashPhotoDtoFromJson(Map<String, dynamic> json) =>
    UnsplashPhotoDto(
      id: json['id'] as String,
      urls: UnsplashUrlsDto.fromJson(json['urls'] as Map<String, dynamic>),
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : UnsplashUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

UnsplashUrlsDto _$UnsplashUrlsDtoFromJson(Map<String, dynamic> json) =>
    UnsplashUrlsDto(
      small: json['small'] as String,
      regular: json['regular'] as String,
    );

UnsplashUserDto _$UnsplashUserDtoFromJson(Map<String, dynamic> json) =>
    UnsplashUserDto(name: json['name'] as String);
