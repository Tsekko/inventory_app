import 'package:flutter/material.dart';
import 'package:inventory_app/main.dart';

class Item {
  final String name;
  final int qty;

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

class ProductInventory extends StatefulWidget {
  static const routeName = "/productInventory";
  const ProductInventory({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductInventory> createState() => _ProductInventoryState();
}

class _ProductInventoryState extends State<ProductInventory> {
  final _lstPeluche = <Item>[
    Item(name: "Ours", qty: 4),
    Item(name: "Loup", qty: 1),
    Item(name: "Otarie", qty: 2)
  ];
  final _lstBoissons = <Item>[Item(name: "Eau", qty: 3), Item(name: "Cidre", qty: 5)];
  var _lstItem = <Item>[];
  bool isEditing = false;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "Test");
  }

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
                        child: !isEditing ? Text(
                          _lstItem[index].name,
                          style: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ) : TextField(
                          controller: _controller,
                          onSubmitted: (String value) async {setState(() {
                            _lstItem[index] = _lstItem[index].copyWith(name: value);
                          });},
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Quantité : " + _lstItem[index].qty.toString(),
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: ElevatedButton(child: const Icon(Icons.remove), onPressed: () {setState((() {
                            _lstItem[index] = _lstItem[index].copyWith(qty: _lstItem[index].qty-1); 
                          }),);},),),
                          Expanded(child: ElevatedButton(child: const Icon(Icons.add), onPressed: () {setState(() {
                            _lstItem[index] = _lstItem[index].copyWith(qty: _lstItem[index].qty+1);
                          });},),),
                          Expanded(child: ElevatedButton(child: Icon(Icons.edit), onPressed: () {setState(() {
                            isEditing = !isEditing;
                          });},),),
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
