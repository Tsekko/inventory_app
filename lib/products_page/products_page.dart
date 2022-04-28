import 'package:flutter/material.dart';
import 'package:inventory_app/main.dart';
import 'package:inventory_app/models/item.dart';
import 'package:inventory_app/models/product.dart';
import 'package:inventory_app/products_page/widgets/products_card.dart';

class ProductInventory extends StatefulWidget {
  static const routeName = "/productInventory";
  const ProductInventory({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductInventory> createState() => _ProductInventoryState();
}

class _ProductInventoryState extends State<ProductInventory> {
  var _lstPeluche = <Item>[
    Item(name: "Ours", qty: 4),
    Item(name: "Loup", qty: 1),
    Item(name: "Otarie", qty: 2)
  ];
  var _lstBoissons = <Item>[
    Item(name: "Eau", qty: 3),
    Item(name: "Cidre", qty: 5)
  ];
  var _lstItem = <Item>[];

  @override
  Widget build(BuildContext context) {
    if (widget.product.name == "Peluche") {
      _lstItem = _lstPeluche;
    } else {
      _lstItem = _lstBoissons;
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: Text(
              widget.product.name,
              style:
                  const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: GridView.builder(
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _lstItem.length,
                itemBuilder: (context, index) {
                  return ProductCard(item: _lstItem[index]);
                }),
          ),
        ],
      ),
    );
  }
}
