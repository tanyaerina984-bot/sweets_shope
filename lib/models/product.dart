import 'package:flutter/material.dart';

enum ProductStatus { available, occupied }

class Product {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  ProductStatus status;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.status,
  });

  String get statusText {
    return status == ProductStatus.available ? 'Свободен' : 'Занят';
  }

  Color get statusColor {
    return status == ProductStatus.available ? Colors.green : Colors.red;
  }
}