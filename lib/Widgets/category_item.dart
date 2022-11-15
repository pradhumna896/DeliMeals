import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({Key? key,required this.color,required this.title,required this.id}) : super(key: key);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/categories-meals',
    arguments: {
      'id':id,
      'title':title
    }
    );

  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        selectCategory(context);

      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
    
  }
}