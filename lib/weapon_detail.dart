import 'package:flutter/material.dart';
import 'package:valorantapp/models/game_map.dart';

class MapDetail extends StatelessWidget {
  final GameMap singleMap;
  MapDetail(this.singleMap);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildOverlayImage(Theme.of(context), singleMap.name, singleMap.imageName)
    );
  }
}

Widget buildOverlayImage(ThemeData theme, String name, String image){
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
                child: Text(
                  name,
                  style: theme.textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}