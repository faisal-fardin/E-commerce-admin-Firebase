import 'package:adminapps/models/product_model.dart';
import 'package:adminapps/provider/product_provider.dart';
import 'package:adminapps/utlis/widget_funcation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utlis/constants.dart';

class ProductDetailsPages extends StatefulWidget {
  static const String routeName = '/productdetails';

  const ProductDetailsPages({super.key});

  @override
  State<ProductDetailsPages> createState() => _ProductDetailsPagesState();
}

class _ProductDetailsPagesState extends State<ProductDetailsPages> {
  late String id;
  late ProductModel productModel;
  late ProductProvider provider;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    provider = Provider.of<ProductProvider>(context);
    productModel = provider.getProductByid(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.name),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            fadeInDuration: const Duration(seconds: 2),
            fadeInCurve: Curves.easeInOut,
            imageUrl: productModel.imageUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          ListTile(
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                )),
            title: Text(productModel.category.name),
            subtitle: Text(productModel.description ?? 'Description not found'),
          ),
          ListTile(
            title: Text(
              '$currencySymbol ${productModel.price}',
              style: const TextStyle(fontSize: 22),
            ),
            subtitle: Text(
              'After discount : ${provider.priceAfterDiscount(productModel.price, productModel.discount)}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            trailing: IconButton(
                onPressed: () {
                  showSingleTextInputDialog(
                    context: context,
                    title: 'Update Discount',
                    onSave: ((value) {
                      provider.updateProductField(id, 'discount', int.parse(value));
                    }),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                )),
            subtitle: Text(
              'Discount : ${productModel.discount}%',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
