import 'package:flutter/material.dart';
import 'mock/mock_game_map.dart';
import 'package:valorantapp/models/game_map.dart';

class MapScreen extends StatelessWidget {
  ThemeData theme;

  MapScreen(this.theme);

  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final gameMaps = MockGameMaps.items;

    print(MediaQuery.of(context).size.width);
    return ListView(
      children: gameMaps.map(_buildCell).toList(),
    );
  }

  Widget _buildCell(GameMap singleMap) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 1,
              child: Image.asset(singleMap.imageName, fit: BoxFit.contain)),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(.5)),
                  child: Text(
                    singleMap.name,
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
}
