import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';
import '../constants.dart';

class Catalog with ChangeNotifier {
  List<Item> _catalog = [];

  List<Item> get catalog {
    return [..._catalog];
  }

  Future<void> getData() async {
    try {
      http.Response response = await http.get(catalogUrl);

      if (response.statusCode == 200) {
        print(response.body);

        List<dynamic> extractedData =
            json.decode(utf8.decode(response.bodyBytes));
        print(extractedData);

        List<Item> loadedCatalog = [];
        for (int i = 0; i < extractedData.length; i++) {
          final catalog = Item(
            itemUuid: extractedData[i]['uuid'],
            itemName: extractedData[i]['name'],
            image: extractedData[i]['image'],
            description: extractedData[i]['description'],
            unitTime: extractedData[i]['unit_time'],
            unitType: extractedData[i]['unit_type'],
            unitPrice: extractedData[i]['unit_price'],
            categoryUuid: extractedData[i]['category']['uuid'],
            categoryName: extractedData[i]['category']['name'],
          );

          loadedCatalog.add(catalog);
        }

        _catalog = loadedCatalog;
        notifyListeners();
        print(_catalog);
      } else {
        print(
            'status from catalog getdata method else = ${response.statusCode}');
      }
    } catch (error) {
      print('error from catalog getdata method = $error');
    }
  }
}
