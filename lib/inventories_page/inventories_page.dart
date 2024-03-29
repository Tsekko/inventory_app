import 'package:flutter/material.dart';
import 'package:inventory_app/models/product.dart';
import 'package:inventory_app/models/item.dart';

import '../products_page/products_page.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final _catList = <Product>[
    const Product(id: 1, name: "Peluches", lstItems: [
      Item(name: "Ours", qty: 4),
      Item(name: "Loup", qty: 1),
      Item(name: "Otarie", qty: 2)
    ]),
    const Product(id: 2, name: "Boissons", lstItems: [])
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stock",
          style: TextStyle(fontSize: 32.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _catList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            leading: Text(_catList[index].id.toString()),
            title: Text(_catList[index].name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, ProductInventory.routeName,
                  arguments: _catList[index]);
            },
          ));
        },
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addProduct,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

void _addProduct() {}
