import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Item {
  final String itemUuid;
  final String itemName;
  final String image;
  final String description;
  final String unitType;
  final int unitTime;
  final String unitPrice;
  final String categoryUuid;
  final String categoryName;

  Item({
    this.itemUuid,
    this.itemName,
    this.image,
    this.description,
    this.unitType,
    this.unitTime,
    this.unitPrice,
    this.categoryUuid,
    this.categoryName,
  });
}
