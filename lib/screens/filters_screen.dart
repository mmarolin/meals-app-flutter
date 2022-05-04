import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegeterian = widget.currentFilters['vegeterian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentVal,
    Function(bool) updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      activeColor: Theme.of(context).colorScheme.secondary,
      value: currentVal,
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.save_outlined, size: 26),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your filters for meal selection',
              style: Theme.of(context).textTheme.headline6),
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        ),
        Expanded(
          child: ListView(children: <Widget>[
            _buildSwitchListTile(
              'Gluten-Free',
              'Only include gluten free meals.',
              _glutenFree,
              (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Lactose-Free',
              'Only include lactose free meals.',
              _lactoseFree,
              (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Vegeterian',
              'Only include vegeterian meals.',
              _vegeterian,
              (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vegan meals.',
              _vegan,
              (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
            ),
          ]),
        )
      ]),
    );
  }
}
