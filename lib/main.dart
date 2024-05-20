import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dishes_view_model.dart';
import 'home_screen.dart';
import 'cart_screen.dart'; // Assurez-vous d'avoir un fichier cart_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DishesViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/cart': (context) => const CartScreen(), // Assurez-vous d'avoir implémenté CartScreen
        },
      ),
    );
  }
}
