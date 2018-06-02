import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart' as model;
import 'package:bulletfinger/views/game.dart';

class SearchGames extends StatefulWidget{
  final List<model.Game> playerGames;
  final List<model.Game> games;

  SearchGames(this.playerGames, this.games, {Key key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return new SearchGamesState(playerGames, games);
  }

}


class SearchGamesState extends State<SearchGames> {
  final List<model.Game> playerGames;
  final List<model.Game> games;
  List<model.Game> _foundGames;

  SearchGamesState(this.playerGames, this.games) {
    _foundGames = new List.generate(games.length, (i) => games[i]);
  }

  void find(String text) {
    setState(() {
      _foundGames = new List();
      games.forEach((element) {
        if (element.locationName.contains(text) ||
            element.dateTimeString.contains(text))
        {
          _foundGames.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = new List.generate(_foundGames.length, (index) {
      return new Game(_foundGames[index], playerGames);
    });
    items.insert(0, new TextField(
      decoration: new InputDecoration(
        icon: new Icon(Icons.search),
        hintText: 'Buscar',
      ),
      onChanged: (text) => find(text),
    ));
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 16.0),
      child: new ListView(
        children: items
      ),
    );
  }
}