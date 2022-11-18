import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filters';
  void Function(Map<String, bool>) saveFilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    
    super.initState();
  }
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile(
        subtitle: Text(description),
        title: Text(title),
        value: currentValue,
        onChanged: updateValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              final selectFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };

              widget.saveFilters(selectFilters as Map<String, bool>);
            },
            icon: Icon(Icons.save))
      ], title: Text("Your Filters")),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-free", "Only include gluten-free meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile("Lactose-free",
                  "Only include lactose-free meals", _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "Only include vegetarian meals", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile("Vegan", "Only include vegan meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
