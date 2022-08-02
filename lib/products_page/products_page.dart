import 'package:flutter/material.dart';
import 'package:inventory_app/item_form/item_form_page.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool isAdding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.builder(
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: widget.product.lstItems.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    item: widget.product.lstItems[index],
                    onItemQuantityUpdated: (int qty) => _updateQty(qty, index),
                    onItemTitleUpdated: (String title) =>
                        _updateTitle(title, index),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Item? item = await Navigator.of(context)
              .pushNamed<Item?>(ItemFormPage.routeName);
          if (item != null) {
            List<Item> lstItem = widget.product.lstItems;
            lstItem.add(item);
            setState(() {
              widget.product.lstItems = lstItem;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _updateQty(int qty, int index) {
    setState(() {
      widget.product.lstItems[index] =
          widget.product.lstItems[index].copyWith(qty: qty);
    });
  }

  void _updateTitle(String title, int index) {
    setState(() {
      widget.product.lstItems[index] =
          widget.product.lstItems[index].copyWith(name: title);
    });
  }
}
