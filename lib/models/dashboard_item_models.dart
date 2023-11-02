import 'package:adminapps/pages/view_product_screen.dart';
import 'package:flutter/material.dart';

import '../pages/add_new_category.dart';
import '../pages/new_product_screen.dart';

class DashboardItem {
  final IconData icon;
  final String name;
  final String route;

  DashboardItem({
    required this.icon,
    required this.name,
    required this.route,
  });

  static List<DashboardItem> dashboardItemList = [

    DashboardItem(icon: Icons.add, name: "Add Product", route: NewProductScreen.routeName,),

    DashboardItem(icon: Icons.list, name: "View Product", route: ViewProductScreen.routeName,),

    DashboardItem(icon: Icons.category, name: "Category", route: AddNewCategory.routeName,),

  ];
}
