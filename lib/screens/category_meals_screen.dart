import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';


class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  const CategoryMealsScreen({Key? key,
  //  required this.categoryId,
  //  required this.categoryTitle
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String ,String>;
    final categoriesTitle = routeArgs['title'];
    final categoriesId = routeArgs['id'];
    final categoriesMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoriesId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return Text(categoriesMeals[index].title);
      },
      itemCount: categoriesMeals.length,
      ),
    );
    
  }
}