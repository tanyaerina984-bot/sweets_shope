import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Торт "Наполеон"',
      description: 'Классический слоёный торт с заварным кремом',
      imagePath: 'assets/images/наполеон.jpg',
      status: ProductStatus.available,
    ),
    Product(
      id: '2',
      name: 'Пирожное "Красный бархат"',
      description: 'Нежный бисквит с сырным кремом',
      imagePath: 'assets/images/красный бархат.jpg',
      status: ProductStatus.available,
    ),
    Product(
      id: '3',
      name: 'Набор макарун',
      description: 'Ассорти из 6 вкусов',
      imagePath: 'assets/images/макаруны.jpg',
      status: ProductStatus.occupied,
    ),
    Product(
      id: '4',
      name: 'Чизкейк "Нью-Йорк"',
      description: 'Плотный сливочный чизкейк на песочной основе',
      imagePath: 'assets/images/чизкейк.jpg',
      status: ProductStatus.available,
    ),
    Product(
      id: '5',
      name: 'Эклеры ассорти',
      description: 'Заварные пирожные с шоколадом и ванилью',
      imagePath: 'assets/images/эклеры.jpg',
      status: ProductStatus.occupied,
    ),
  ];

  List<Product> get products => _products;

  Product getProductById(String id) {
    return _products.firstWhere((p) => p.id == id);
  }

  void toggleProductStatus(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index].status = (_products[index].status == ProductStatus.available)
          ? ProductStatus.occupied
          : ProductStatus.available;
      notifyListeners();
    }
  }
}