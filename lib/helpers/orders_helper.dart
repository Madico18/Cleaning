import 'package:flutter/material.dart';
import 'package:washing/models/cart_item_model.dart';
import '../models/order_model.dart';
import '../models/item_model.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orderItems = [];

  List<OrderItem> get orderItems {
    return [..._orderItems];
  }

  void addOrder(List<CartItem> items, double total) {
    _orderItems.insert(0,
        OrderItem(id: DateTime.now().toString(), amount: total, items: items));
    notifyListeners();
  }

  void removeItem(String uuid) {
    _orderItems.remove(uuid);
    notifyListeners();
  }

  void clearOrder() {
    _orderItems = [];
    notifyListeners();
  }
}
