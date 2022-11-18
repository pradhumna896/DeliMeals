import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
final List<Meal> favoriteMeals;
FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Fave"),);
    
  }
}