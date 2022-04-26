import 'package:flutter/material.dart';
import 'package:inventory_app/main.dart';

class Item {
  final String name;
  final int qty;

  const Item(this.name, this.qty);
}

class ProductInventory extends StatefulWidget {
  static const routeName = "/productInventory";
  const ProductInventory({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductInventory> createState() => _ProductInventoryState();
}

class _ProductInventoryState extends State<ProductInventory> {
  final _lstPeluche = <Item>[
    const Item("Ours", 4),
    const Item("Loup", 1),
    const Item("Otarie", 2)
  ];
  final _lstBoissons = <Item>[const Item("Eau", 3), const Item("Cidre", 5)];
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
                  return Card(
                    child: Column(children: [
                      Expanded(
                        child: Text(
                          _lstItem[index].name,
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Quantité : " + _lstItem[index].qty.toString(),
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(child: Icon(Icons.remove)),
                          Expanded(child: Icon(Icons.add)),
                          Expanded(child: Icon(Icons.edit)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
