import 'package:flutter/material.dart';

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
    );
  }
}
