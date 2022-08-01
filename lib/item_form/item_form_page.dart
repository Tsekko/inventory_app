import 'package:flutter/material.dart';
import 'package:inventory_app/models/item.dart';

class ItemFormPage extends StatefulWidget {
  static const routeName = "/itemFormPage";
  const ItemFormPage({Key? key}) : super(key: key);

  @override
  State<ItemFormPage> createState() => _FormPageState();
}

class _FormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  Item newItem = Item(name: "", qty: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nom du produit : ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field needs to be completed";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newItem = newItem.copyWith(name: value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Quantité : ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field needs to be completed";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newItem = newItem.copyWith(qty: int.parse(value!));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      Navigator.of(context).pop(newItem);
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            )));
  }
}
