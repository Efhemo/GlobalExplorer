import 'package:equatable/equatable.dart';

class CountryImage extends Equatable {
  const CountryImage({
    required this.id,
    required this.smallUrl,
    required this.regularUrl,
    this.description,
    this.photographerName,
  });

  final String id;
  final String smallUrl;
  final String regularUrl;
  final String? description;
  final String? photographerName;

  @override
  List<Object?> get props => [id];
}
