import 'package:adminapps/pages/add_new_category.dart';
import 'package:adminapps/pages/dashboard_screen.dart';
import 'package:adminapps/pages/launcher_screen.dart';
import 'package:adminapps/pages/logIn_screen.dart';
import 'package:adminapps/pages/new_product_screen.dart';
import 'package:adminapps/pages/view_product_screen.dart';
import 'package:adminapps/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LauncherScreen.routeName,
      builder: EasyLoading.init(),
      routes: {
        LauncherScreen.routeName: (_) => const LauncherScreen(),
        LogInScreen.routeName: (_) => const LogInScreen(),
        DashboardScreen.routeName: (_) => const DashboardScreen(),
        AddNewCategory.routeName: (_) => const AddNewCategory(),
        NewProductScreen.routeName: (_) => const NewProductScreen(),
        ViewProductScreen.routeName: (_) => const ViewProductScreen(),
      },
    );
  }
}
