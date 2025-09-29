import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/home_page.dart';
import 'package:shop_app/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: 
          ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(250, 204, 1, 1),
            primary: Color.fromRGBO(250, 204, 1, 1), 
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ), 
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ), 
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 35,
                     ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
           ),
           bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
           ),
          ),
          useMaterial3: true,
         ),
        title: 'Shopping App', 
        home: Provider(
          create: (context) => 'Helllooo',
          child: const HomePage(
          ),
        ),
      ),
    );
  }
}