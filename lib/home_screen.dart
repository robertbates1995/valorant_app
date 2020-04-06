import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildContainer());
  }

  Container _buildContainer() {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            'assets/images/Valorant Logo.png',
          ));
  }

  AppBar _buildAppBar() {
    return AppBar(
        centerTitle: true,
        title: Text(
          'VALORANT',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      );
  }
}
