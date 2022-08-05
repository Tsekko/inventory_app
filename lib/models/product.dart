import 'package:flutter/cupertino.dart';

import 'item.dart';

@immutable
class Product {
  final int id;
  final String name;
  final List<Item> lstItems;

  const Product({required this.id, required this.name, required this.lstItems});

  Product copyWith({
    String? name,
    List<Item>? lstItems,
  }) {
    return Product(
        id: id, name: name ?? this.name, lstItems: lstItems ?? this.lstItems);
  }
}
