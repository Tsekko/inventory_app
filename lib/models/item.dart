import 'package:flutter/cupertino.dart';

@immutable
class Item {
  final String name;
  final int qty;

  const Item({required this.name, required this.qty});

  Item copyWith({
    String? name,
    int? qty,
  }) {
    return Item(
      name: name ?? this.name,
      qty: qty ?? this.qty,
    );
  }
}
