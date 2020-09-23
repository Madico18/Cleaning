import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String itemUuid;
  final String itemName;
  final String image;
  final String description;
  final String unitType;
  final int unitTime;
  final String unitPrice;
  final int quantity;

  CartItem({
    this.id,
    this.itemName,
    this.description,
    this.itemUuid,
    this.image,
    this.unitPrice,
    this.unitTime,
    this.unitType,
    this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += double.parse(item.unitPrice) * item.quantity;
    });

    return total;
  }

  void addItem(
    String key,
    String itemUuid,
    String itemName,
    String image,
    String description,
    String unitType,
    int unitTime,
    String unitPrice,
  ) {
    if (_items.containsKey(key)) {
      _items.update(
        key,
        (oldItem) => CartItem(
          id: DateTime.now().toString(),
          itemUuid: oldItem.itemUuid,
          itemName: oldItem.itemName,
          image: oldItem.image,
          description: oldItem.description,
          unitPrice: oldItem.unitPrice,
          unitType: oldItem.unitType,
          unitTime: oldItem.unitTime,
          quantity: oldItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        itemUuid,
        () => CartItem(
          id: DateTime.now().toString(),
          itemUuid: itemUuid,
          itemName: itemName,
          image: image,
          description: description,
          unitPrice: unitPrice,
          unitType: unitType,
          unitTime: unitTime,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
