import 'package:flutter/material.dart';
import 'package:valorantapp/agents_screen.dart';
import 'package:valorantapp/valorant_screen.dart';
import 'package:valorantapp/weapons_screen.dart';
import 'maps_screen.dart';

enum PageIndex{
  maps, agents, weapons,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageIndex _selectedDrawerIndex = PageIndex.maps;

  Widget _getDrawerItemWidget(PageIndex pos) {
    switch (pos) {
      case PageIndex.maps:
        return MapScreen(Theme.of(context));
      case PageIndex.agents:
        return AgentsScreen(Theme.of(context));
      case PageIndex.weapons:
        return WeaponScreen(Theme.of(context));
      default: return Text('error');
    }
  }

  _onSelectItem(PageIndex index) {
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
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: ValorantScreen()),
              listTile("Maps", PageIndex.maps),
              listTile("Agents", PageIndex.agents),
              listTile("Weapons", PageIndex.weapons),
              AboutListTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(String title, PageIndex index) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 4),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4//Theme.of(context).textTheme.headline2,
        ),
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
      style: Theme
          .of(context)
          .textTheme
          .headline1,
    );
  }
}