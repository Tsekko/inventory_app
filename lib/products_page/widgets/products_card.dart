import 'package:flutter/material.dart';
import 'package:inventory_app/models/item.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.item,
      required this.onItemQuantityUpdated,
      required this.onItemTitleUpdated})
      : super(key: key);

  final Item item;
  final Function(int) onItemQuantityUpdated;
  final Function(String) onItemTitleUpdated;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isEditing = false;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "Test");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Expanded(
          child: !_isEditing
              ? Text(
                  widget.item.name,
                  style: const TextStyle(
                      fontSize: 32.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )
              : TextField(
                  controller: _controller =
                      TextEditingController(text: widget.item.name),
                  onSubmitted: (String value) async {
                    widget.onItemTitleUpdated(value);
                  },
                ),
        ),
        Expanded(
          child: Text(
            "Quantité : " + widget.item.qty.toString(),
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  if (widget.item.qty > 0) {
                    widget.onItemQuantityUpdated(widget.item.qty - 1);
                  }
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  widget.onItemQuantityUpdated(widget.item.qty + 1);
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ]),
    );
  }
}
