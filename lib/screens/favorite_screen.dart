import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../Widgets/meal_item.dart';
import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
final List<Meal> favoriteMeals;
FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(child: 
    Text("you have no favorite yet - start adding some!"),);
    
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
    
  }
}