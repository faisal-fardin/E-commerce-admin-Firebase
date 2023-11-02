import 'package:flutter/material.dart';

class NewProductScreen extends StatefulWidget {
  static String routeName = 'newproduct';
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
