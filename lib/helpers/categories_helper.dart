import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';
import '../constants.dart';

class Categories with ChangeNotifier {
  List<ItemCategory> _categories = [];

  List<ItemCategory> get categories {
    return [..._categories];
  }

  Future<void> getData() async {
    try {
      http.Response response = await http.get(categoriesUrl);

      if (response.statusCode == 200) {
        print(response.body);

        List<dynamic> extractedData =
            json.decode(utf8.decode(response.bodyBytes));
        print(extractedData);

        List<ItemCategory> loadedCategories = [];
        for (int i = 0; i < extractedData.length; i++) {
          final category = ItemCategory(
            uuid: extractedData[i]['uuid'],
            categoryName: extractedData[i]['name'],
            categoryDescription: extractedData[i]['description'],
            categoryImage: extractedData[i]['image'],
          );

          loadedCategories.add(category);
        }

        _categories = loadedCategories;
        notifyListeners();
        print(_categories);
      } else {
        print('status from getdata method else = ${response.statusCode}');
      }
    } catch (error) {
      print('error from getdata method = $error');
    }
  }
}
