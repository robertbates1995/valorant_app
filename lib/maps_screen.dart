import 'package:flutter/material.dart';

import 'mock/mock_game_map.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    // NOTE: we'll be moving this to a scoped_model later
    final gameMaps = MockGameMaps.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: ListView(
        children: gameMaps
            .map((gameMap) => Text(gameMap.name))
            .toList(),
      ),
    );
  }
}
