
import 'package:adminapps/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPages extends StatefulWidget {
  static const String routeName = '/productdetails';
  const ProductDetailsPages({super.key});

  @override
  State<ProductDetailsPages> createState() => _ProductDetailsPagesState();
}

class _ProductDetailsPagesState extends State<ProductDetailsPages> {

  late String id;
  @override
  void didChangeDependencies() {
    id  = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) => ListView(

        ),
      ),
    );
  }
}
