
import 'package:adminapps/db/db_helper.dart';
import 'package:flutter/foundation.dart';
import '../models/category_models.dart';

class ProductProvider extends ChangeNotifier{

  List<CategoryModels> categoryList = [];

  Future<void> addCategory(String name){
    final category =  CategoryModels(name: name);

    return DBHelper.addCategory(category);
  }

  getAllCategories(){
    DBHelper.getAllCategory().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length, (index) =>
          CategoryModels.fromJson(snapshot.docs[index].data()
          ));
      notifyListeners();
    });
  }

}