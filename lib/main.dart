import 'package:flutter/material.dart';
import 'package:nike_app/provider/cart_provider.dart';
import 'package:nike_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Nike Store',
        theme: ThemeData(
          fontFamily: 'FairDisplay',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 129, 85, 210),
            primary: const Color.fromARGB(255, 129, 85, 210),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              )),
          useMaterial3: true,
        ),
        home:HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
