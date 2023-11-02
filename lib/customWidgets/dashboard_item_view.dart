

import 'package:flutter/material.dart';
import '../models/dashboard_item_models.dart';
class DashboardItemView extends StatelessWidget {

  final DashboardItem item;
  const DashboardItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Card(
        color: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon , size: 30, color: Colors.white,),
              Text(item.name ,style: const TextStyle(color: Colors.white,fontSize: 22), ),
            ],
          ),
        ),
      ),
    );
  }
}
