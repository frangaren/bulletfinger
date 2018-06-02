import 'game.dart';
import 'profile.dart';
import 'statistics.dart';
import 'video.dart';

class Model {
  final List<Game> games;

  final Profile me;
  final Statistics statistics;
  final List<Game> myGames;
  final List<Profile> friends;
  final List<Video> videos;

  Model(this.games, this.me, this.statistics, this.myGames, this.friends, this.videos);

  factory Model.randomize([int seed]) {
    List<Game> games = new List();
    for (int i = 0; i < 100; i++) {
      games.add(new Game.randomize(seed));
    }
    Profile me = new Profile.randomize(seed: seed);
    Statistics statistics = new Statistics.randomize(seed);
    List<Game> myGames = new List();
    List<Profile> friends = new List();
    List<Video> videos = new List();
    for (int i = 0; i < 10; i++) {
      videos.add(new Video.randomize(seed));
    }
    return new Model(games, me, statistics, myGames, friends, videos);
  }

}