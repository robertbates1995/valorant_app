import 'package:flutter/material.dart';
import 'package:valorantapp/weapon_detail.dart';
import 'package:valorantapp/mock/mock_weapon.dart';
import 'package:valorantapp/models/weapon.dart';

class WeaponScreen extends StatelessWidget {
  ThemeData theme;

  WeaponScreen(this.theme);

  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final gameWeapons = MockWeapons.items;

    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {} //TODO
          )
        ],
        title: Text('Sort by Class:'),
      ),
      body: ListView(
        children: gameWeapons
            .map((singleWeapon) => _buildCell(singleWeapon, context))
            .toList(),
      ),
    );
  }

  Widget _buildCell(Weapon singleWeapon, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapDetail(singleWeapon)),
          );
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 1,
                  child:
                      Image.asset(singleWeapon.imageName, fit: BoxFit.contain)),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(.5)),
                      child: Text(
                        singleWeapon.name,
                        style: theme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
