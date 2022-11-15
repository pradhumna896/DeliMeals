import 'package:flutter/material.dart';
import 'package:mealsapp/categories_screen.dart';
import 'package:mealsapp/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
       
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
           bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          subtitle1:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const CategoreisScreen(),
        '/categories-meals':(context) => const CategoryMealsScreen()
      },
    );
  }
}
