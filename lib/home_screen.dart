import 'package:flutter/material.dart';
import 'package:valorantapp/valorant_screen.dart';

import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ValorantScreen();
      case 1:
        return MapScreen();

      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: _buildDrawer(),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          listTile("Valorant", 0),
          listTile("Maps", 1)
        ],
      ),
    );
  }

  ListTile listTile(String title, int index) {
    return ListTile(
      title: Text(title),
      selected: _selectedDrawerIndex == index,
      onTap: () => _onSelectItem(index),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: _mainTitleMaker(),
    );
  }

  //made following function to test out how extract=>method works
  Text _mainTitleMaker() {
    return Text(
      'VALORANT',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xffff4656)),
    );
  }
}
