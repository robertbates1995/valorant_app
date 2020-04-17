import 'package:flutter/material.dart';
import 'mock/mock_game_map.dart';
import 'package:valorantapp/models/game_map.dart';

class MapScreen extends StatelessWidget {
  ThemeData theme;
  MapScreen(this.theme);
  @override
  Widget build(BuildContext context){
    // NOTE: we'll be moving this to a scoped_model later
    final gameMaps = MockGameMaps.items;

    return ListView(
        children: gameMaps
            .map((gameMap) => _buildCell(gameMap))
            .toList(),
      );
  }

  Widget _buildCell(GameMap gameMap) {
    return Row(
      children: <Widget>[
        Image.asset(gameMap.imageName),
        Text(gameMap.name, style: theme.textTheme.headline3,),
      ],
    );
  }
}
