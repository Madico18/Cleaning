import 'package:flutter/material.dart';
import 'package:washing/models/cart_item_model.dart';
import '../models/item_model.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> items;

  OrderItem({this.id, this.amount, this.items});
}
