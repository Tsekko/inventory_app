class Item {
  String name;
  int qty;

  Item({required this.name, required this.qty});

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
