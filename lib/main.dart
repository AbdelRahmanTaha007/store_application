import 'package:flutter/material.dart';
import 'package:store_app/home_view.dart';
import 'package:store_app/update_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (context) => HomeView(),
        UpdateProductView.route: (context) => UpdateProductView(),
      },
    );
  }
}
