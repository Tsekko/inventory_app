import 'package:flutter/material.dart';
import 'package:inventory_app/inventories_page/inventories_page.dart';
import 'package:inventory_app/item_form/item_form_page.dart';
import 'package:inventory_app/models/item.dart';
import 'package:inventory_app/products_page/products_page.dart';
import 'package:inventory_app/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == ProductInventory.routeName) {
          final args = settings.arguments as Product;

          return MaterialPageRoute<dynamic>(builder: (context) {
            return ProductInventory(product: args);
          });
        }

        if (settings.name == ItemFormPage.routeName) {
          return MaterialPageRoute<Item>(builder: (context) {
            return const ItemFormPage();
          });
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Inventory(),
    );
  }
}
