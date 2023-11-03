import 'dart:io';

import 'package:adminapps/models/category_models.dart';
import 'package:adminapps/models/product_model.dart';
import 'package:adminapps/provider/product_provider.dart';
import 'package:adminapps/utlis/widget_funcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../style/style_file.dart';

class NewProductScreen extends StatefulWidget {
  static String routeName = 'newproduct';

  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  String? localImagePath;
  CategoryModels? category;
  final _fromKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Product',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: _saveProduct, icon: const Icon(Icons.save))
        ],
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: _fromKey,
        child: ListView(
          children: [
            _buildImageSection(),
            _buildCategorySection(),
            _buildTextFieldSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            localImagePath == null
                ? const Icon(
                    Icons.card_giftcard,
                    size: 100,
                  )
                : Image.file(
                    File(localImagePath!),
                    width: 100,
                    height: 100,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _getImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Capture'),
                ),
                TextButton.icon(
                  onPressed: () {
                    _getImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_album),
                  label: const Text('Gallery'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _getImage(ImageSource source) async {
    final file =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (file != null) {
      setState(() {
        localImagePath = file.path;
      });
    }
  }

  Widget _buildCategorySection() {
    return Card(
      child: Consumer<ProductProvider>(
        builder: (context, provider, child) =>
            DropdownButtonFormField<CategoryModels>(
          value: category,
          hint: const Text('Select a Category'),
          isExpanded: true,
          items: provider.categoryList
              .map(
                (category) => DropdownMenuItem<CategoryModels>(
                  value: category,
                  child: Text(category.name),
                ),
              )
              .toList(),
          onChanged: (valaue) {
            setState(() {
              category = valaue;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'This Field must not be empty';
            }
            return null;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget _buildTextFieldSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextFormField(
            controller: _nameController,
            decoration: appInputStyle(
              'Product Name',
              const Icon(null),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _priceController,
            decoration: appInputStyle(
              'Product Price',
              const Icon(null),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextFormField(
            maxLines: 4,
            controller: _descriptionController,
            decoration: appInputStyle(
              'Product Description',
              const Icon(null),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _stockController,
            decoration: appInputStyle(
              'Product Stock',
              const Icon(null),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field must not be empty';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _saveProduct() async {
    if (localImagePath == null) {
      showMsg(context, 'Please Select Product Image');
      return;
    }
    if (_fromKey.currentState!.validate()) {
      final imageUrl = await Provider.of<ProductProvider>(context,listen: false).uploadImage(localImagePath!);
      final productModel = ProductModel(
        name: _nameController.text,
        category: category!,
        price: num.parse(_priceController.text),
        stock: num.parse(_stockController.text),
        imageUrl: imageUrl,
      );
      EasyLoading.show(status: 'Please Wait');
      Provider.of<ProductProvider>(context,listen: false)
      .addProduct(productModel)
      .then((value) {
        EasyLoading.dismiss();
        showMsg(context, 'Saved');
        _resetFields();
      })
      .catchError((error){
        EasyLoading.dismiss();
        showMsg(context, 'Cloud not Save');
      });
    }
  }

  void _resetFields() {
    setState(() {
      localImagePath = null;
      category = null;
      _nameController.clear();
      _stockController.clear();
      _descriptionController.clear();
      _priceController.clear();

    });
  }
}
