import 'package:flutter/material.dart';
import 'package:valorantapp/maps_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildContainer(), drawer: _buildDrawer(),);
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          MapsScreen(),
        ],
      ),
    );
  }

  Container _buildContainer() {
    return Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xff0f1922),
        child: Image.asset(
          'assets/images/valorant_logo.png',
        ));
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
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xffff4656)),
    );
  }
}
