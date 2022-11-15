import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context , String text){
    return  Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
  }

  Widget buildContainer(Widget child,){
     return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: child,);

  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere(((element) => element.id == mealId));
    return Scaffold(
        appBar: AppBar(title: Text('${selectMeal.title}')),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
             buildSectionTitle(context, 'Ingredient'),
             buildContainer(
              ListView.builder(
                  itemCount: selectMeal.ingredients.length,
                  itemBuilder: ((context, index) {
                   return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: Text(selectMeal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  })),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
              ListView.builder(
                  itemCount: selectMeal.steps.length,
                  itemBuilder: ((context, index) {
                   return Column(
                     children: [
                       ListTile(
                        leading: CircleAvatar(child: Text('# ${index +1}')),
                        title: Text(selectMeal.steps[index]),
                       ),
                       Divider()
                     
                     ],
                   );
                  })),
              ),
             
            ],
          ),
        ));
  }
}