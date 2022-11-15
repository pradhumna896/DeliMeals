import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl})
      : super(key: key);
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id
      );

  }

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      Default:
        return 'unKnown';
      
    }
  }

   String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      Default:
        return 'unKnown';
      
    }
   }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    width:300,
                    color: Colors.black54,
                    child: Text(title,style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  const Icon(Icons.schedule),
                  const SizedBox(width: 6,),
                  Text("$duration min")
                ],),
                 Row(children: [
                  const Icon(Icons.work),
                  const SizedBox(width: 6,),
                  Text("$complexityText")
                ],),

                Row(children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 6,),
                  Text("$affordabilityText")
                ],),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
