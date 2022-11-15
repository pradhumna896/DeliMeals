import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesTitle!),
      ),
    );
    
  }
}