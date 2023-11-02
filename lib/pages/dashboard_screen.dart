import 'package:adminapps/customWidgets/dashboard_item_view.dart';
import 'package:adminapps/models/dashboard_item_models.dart';
import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import 'launcher_screen.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {
                AuthService.logout().then(
                  (value) => Navigator.pushReplacementNamed(
                      context, LauncherScreen.routeName),
                );
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: DashboardItem.dashboardItemList.length,
        itemBuilder: (context, index) {
          final item = DashboardItem.dashboardItemList[index];
          return DashboardItemView(item: item);
        },
      ),
    );
  }
}
