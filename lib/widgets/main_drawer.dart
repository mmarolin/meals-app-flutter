import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
                height: 31, color: Theme.of(context).colorScheme.secondary),
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            buildListTile('MEALS', Icons.restaurant),
            SizedBox(height: 10),
            buildListTile('FILTERS', Icons.settings),
          ],
        ),
      ),
    );
  }
}
