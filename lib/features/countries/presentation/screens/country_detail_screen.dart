import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.cca2});

  final String cca2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cca2.toUpperCase())),
      body: Center(child: Text('Detail for $cca2')),
    );
  }
}
