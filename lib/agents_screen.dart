import 'package:flutter/material.dart';
import 'package:valorantapp/map_detail.dart';
import 'package:valorantapp/mock/mock_agent.dart';
import 'package:valorantapp/models/game_map.dart';

class AgentsScreen extends StatelessWidget {
  ThemeData theme;

  AgentsScreen(this.theme);

  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final gameMaps = MockAgents.items;

    print(MediaQuery.of(context).size.width);
    return ListView(
      children: gameMaps.map((singleMap) => _buildCell(singleMap,context)).toList(),
    );
  }

  Widget _buildCell(GameMap singleMap, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapDetail(singleMap)),
          );
        },
        child: AspectRatio(
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
                      decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.5)),
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
        ));
  }
}
