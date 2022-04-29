import 'package:flutter/material.dart';

class ItemFormPage extends StatefulWidget {
  static const routeName = "/itemFormPage";
  const ItemFormPage({Key? key}) : super(key: key);

  @override
  State<ItemFormPage> createState() => _FormPageState();
}

class _FormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Processing Data")),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ));
  }
}
