

import 'package:adminapps/models/category_models.dart';
import 'package:adminapps/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper{

 static final FirebaseFirestore _db = FirebaseFirestore.instance;

 static const String collectionAdmins = 'Admins';
 static const String collectionCategory= 'Categories';
 static const String collectionProduct= 'Product';


 static Future<bool> isAdmin(String uid) async {
   final snapshot =  await _db.collection(collectionAdmins).doc(uid).get();
   return snapshot.exists;
 }

  static Future<void> addCategory(CategoryModels category) {
   final doc  = _db.collection(collectionCategory).doc();
   category.id = doc.id;
   return doc.set(category.toJson());
  }


 static Future<void> addProduct(ProductModel productModel) {
  final doc  = _db.collection(collectionProduct).doc();
  productModel.id = doc.id;
  return doc.set(productModel.toJson());
 }


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategory() =>
      _db.collection(collectionCategory).orderBy('name') .snapshots();
}