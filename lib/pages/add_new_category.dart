import 'package:adminapps/provider/product_provider.dart';
import 'package:adminapps/utlis/widget_funcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatefulWidget {
  static const String routeName = '/category';

  const AddNewCategory({super.key});

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) =>
            ListView.builder(
              itemCount: provider.categoryList.length,
              itemBuilder: (context, index) {
                final category = provider.categoryList[index];
                return ListTile(
                  title: Text(category.name),
                );
            },),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
            context: context,
            title: 'Add Category',
            onSave: (value) {
              EasyLoading.show(status: 'Please Wait');
              Provider.of<ProductProvider>(context, listen: false)
                  .addCategory(value)
                  .then((value) {
                EasyLoading.dismiss();
                showMsg(context, 'Category Saved');
              }).catchError((error) {
                EasyLoading.dismiss();
                showMsg(context, 'Could not Saved');

              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
