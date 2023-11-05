
import 'dart:io';

import 'package:adminapps/db/db_helper.dart';
import 'package:adminapps/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import '../models/category_models.dart';

class ProductProvider extends ChangeNotifier{

  List<CategoryModels> categoryList = [];
  List<ProductModel> productList = [];

  Future<void> addCategory(String name){
    final category =  CategoryModels(name: name);
    return DBHelper.addCategory(category);
  }

  Future<void> addProduct(ProductModel productModel){
    return DBHelper.addProduct(productModel);
  }

  getAllCategories(){
    DBHelper.getAllCategory().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) =>
          CategoryModels.fromJson(snapshot.docs[index].data()
          ));
      notifyListeners();
    });
  }

  getAllProducts(){
    DBHelper.getAllProduct().listen((snapshot) {
      productList = List.generate(snapshot.docs.length, (index) =>
          ProductModel.fromJson(snapshot.docs[index].data()
          ));
      notifyListeners();
    });
  }


  ProductModel getProductByid(String id){
    return productList.firstWhere((element) => element.id == id);
  }

  Future<void> updateProductField(String id, String field, dynamic value){
    return DBHelper.updateProductField(id, {field : value});
  }



  num priceAfterDiscount(num price , int discount){
    return price - (price * discount ~/ 100);
  }

  Future<String> uploadImage(String path) async{
    final imageName= 'Image_${DateTime.now().millisecondsSinceEpoch}';
    final photoRef = FirebaseStorage.instance.ref()
        .child('Picture/$imageName');
    final uploadTask = photoRef.putFile(File(path));
    final snapshot = await uploadTask.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();

  }

}