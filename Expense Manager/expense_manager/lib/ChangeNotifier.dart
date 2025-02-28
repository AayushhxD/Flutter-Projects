import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Map<String, String>> _categories = [
    {"assets/images/Medicine.png": "Medicine"},
    {"assets/images/Food.png": "Food"},
    {"assets/images/Fuel.png": "Fuel"},
    {"assets/images/Shopping.png": "Shopping"},
  ];

  List<Map<String, String>> get categories => _categories;

  void addCategory(String imageUrl, String categoryName) {
    _categories.add({imageUrl: categoryName});
    notifyListeners();
  }

  void deleteCategory(int index) {
    _categories.removeAt(index);
    notifyListeners();
  }
}
