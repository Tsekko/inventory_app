import 'package:flutter/material.dart';

@immutable
class ItemState {
  final String name;
  final int qty;

  const ItemState({
    this.name = "",
    this.qty = 0,
  });

  ItemState copyWith({
    String? name,
    int? qty,
  }) {
    return ItemState(name: this.name, qty: this.qty);
  }
}