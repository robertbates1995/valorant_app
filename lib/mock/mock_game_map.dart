import 'package:valorantapp/models/game_map.dart';

class MockGameMaps {
  static final List<GameMap> items = [1,2,3,4,5]
  .map((index) => GameMap(index, "\(index)")).toList();

}