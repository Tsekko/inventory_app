import 'package:flutter/foundation.dart';
import 'package:inventory_app/models/item.dart';

@immutable
class ProductState {
  final int id;
  final String name;
  final List<Item> lstItems;

  const ProductState({
    required this.id,
    required this.name,
    this.lstItems = const [],
  });

  ProductState copyWith({
    String? name,
    List<Item>? lstItems,
  }) {
    return ProductState(id: id, name: name ?? this.name, lstItems: lstItems ?? this.lstItems);
  }
}