import 'package:flutter/material.dart';
import 'package:valorantapp/models/weapon.dart';

class MapDetail extends StatelessWidget {
  final Weapon singleWeapon;
  MapDetail(this.singleWeapon);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildOverlayImage(Theme.of(context), singleWeapon.name, singleWeapon.imageName, singleWeapon.weaponType)
    );
  }
}

Widget buildOverlayImage(ThemeData theme, String name, String image, String type){
  return AspectRatio(
    aspectRatio: 1,
    child: Stack(
      children: <Widget>[
        AspectRatio(
            aspectRatio: 1,
            child: Image.asset(image, fit: BoxFit.contain)),
        Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration:
                BoxDecoration(color: Colors.black.withOpacity(.5)),
                child: Column(
                  children: <Widget>[
                    Text(
                      name,
                      style: theme.textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),Text(
                      type,
                      style: theme.textTheme.headline3,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}