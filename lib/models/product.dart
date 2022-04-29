import 'item.dart';

class Product {
  int id;
  String name;
  List<Item> lstItems = [];

  Product({required this.id, required this.name, required this.lstItems});

  Product copyWith({
    String? name,
    List<Item>? lstItems,
  }) {
    return Product(
        id: id, name: name ?? this.name, lstItems: lstItems ?? this.lstItems);
  }
}
