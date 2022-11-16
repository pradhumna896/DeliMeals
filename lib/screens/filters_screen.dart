import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mealsapp/Widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);
static const routeName = '/Filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters")),
      drawer: MainDrawer(),  
      
    );
    
  }
}