import 'package:adminapps/pages/product_details_pages.dart';
import 'package:adminapps/provider/product_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProductScreen extends StatefulWidget {
  static String routeName = 'viewproduct';
  const ViewProductScreen({super.key});

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Product', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.productList.length,
          itemBuilder: (context, index) {
            final product = provider.productList[index];
            return ListTile(
              onTap: () => Navigator.pushNamed(context, ProductDetailsPages.routeName,arguments: product.id),
              title: Text(product.name),
              subtitle: Text('Stock${product.stock}'),
              leading: SizedBox(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  fadeInDuration: const Duration(seconds: 2),
                  fadeInCurve: Curves.easeInOut,
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
