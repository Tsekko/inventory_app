import 'package:flutter/material.dart';
import 'package:inventory_app/models/item.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isEditing = false;
  TextEditingController? _controller;
  String title = "";
  int qty = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "Test");
    title = widget.item.name;
    qty = widget.item.qty;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Expanded(
          child: !isEditing
              ? Text(
                  title,
                  style: const TextStyle(
                      fontSize: 32.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )
              : TextField(
                  controller: _controller,
                  onSubmitted: (String value) async {
                    setState(() {
                      widget.item.copyWith(name: value);
                      title = value;
                    });
                  },
                ),
        ),
        Expanded(
          child: Text(
            "Quantité : " + qty.toString(),
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  setState(
                    (() {
                      widget.item.copyWith(qty: qty - 1);
                      qty = qty - 1;
                    }),
                  );
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.item.copyWith(qty: qty + 1);
                    qty = qty + 1;
                  });
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
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
