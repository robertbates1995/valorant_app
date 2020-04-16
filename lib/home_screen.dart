import 'package:flutter/material.dart';
import 'package:valorantapp/valorant_screen.dart';

import 'maps_screen.dart';

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

  Widget _buildDrawer() {
    return Container(
      width: 200,
      child: Drawer(
        child: Container(
          color: Colors.pink,
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Text("categories")),
              listTile("Maps", 1),
              AboutListTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(String title, int index) {
    return _giveEdge(
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            title: Text(
              title,
              textScaleFactor: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            selected: _selectedDrawerIndex == index,
            onTap: () => _onSelectItem(index),
          ),
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

Widget _giveEdge(Widget child) {
  return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
          ),
        ),
        child: child,
      ));
}
