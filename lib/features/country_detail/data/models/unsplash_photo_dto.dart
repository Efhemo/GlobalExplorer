import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/country_image.dart';

part 'unsplash_photo_dto.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true)
class UnsplashSearchResponseDto {
  const UnsplashSearchResponseDto({required this.results});

  final List<UnsplashPhotoDto> results;

  factory UnsplashSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UnsplashSearchResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class UnsplashPhotoDto {
  const UnsplashPhotoDto({
    required this.id,
    required this.urls,
    this.description,
    this.user,
  });

  final String id;
  final UnsplashUrlsDto urls;
  final String? description;
  final UnsplashUserDto? user;

  factory UnsplashPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$UnsplashPhotoDtoFromJson(json);

  CountryImage toDomain() => CountryImage(
        id: id,
        smallUrl: urls.small,
        regularUrl: urls.regular,
        description: description,
        photographerName: user?.name,
      );
}

@JsonSerializable(createToJson: false)
class UnsplashUrlsDto {
  const UnsplashUrlsDto({required this.small, required this.regular});

  final String small;
  final String regular;

  factory UnsplashUrlsDto.fromJson(Map<String, dynamic> json) =>
      _$UnsplashUrlsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class UnsplashUserDto {
  const UnsplashUserDto({required this.name});

  final String name;

  factory UnsplashUserDto.fromJson(Map<String, dynamic> json) =>
      _$UnsplashUserDtoFromJson(json);
}
