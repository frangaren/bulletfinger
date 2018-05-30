import 'dart:math';

class Statistics {
  List<int> _wins;
  List<int> _games;
  List<int> _landedShoots;
  List<int> _shoots;
  List<double> _distances;

  Statistics(this._wins, this._games, this._landedShoots, this._shoots, this._distances);

  static Statistics Randomize([int seed]) {
    Random random = new Random(seed);
    List<int> games = new List(12);
    for (int i = 0; i < 12; i++) {
      games[i] = random.nextInt(32);
    }
    List<int> wins = new List(12);
    for (int i = 0; i < 12; i++) {
      wins[i] = random.nextInt(games[i] + 1);
    }
    List<int> shoots = new List(12);
    for (int i = 0; i < 12; i++) {
      shoots[i] = random.nextInt(games[i] * 1000 + 1);
    }
    List<int> landedShoots = new List(12);
    for (int i = 0; i < 12; i++) {
      landedShoots[i] = random.nextInt(shoots[i] + 1);
    }
    List<double> distances = new List(12);
    for (int i = 0; i < 12; i++) {
      distances[i] = random.nextDouble() * games[i] * 2.0;
    }
    return new Statistics(
      wins,
      games,
      landedShoots,
      shoots,
      distances,
    );
  }

  List<int> get wins {
    return _wins;
  }

  List<int> get loses {
    List<int> loses = new List(_games.length);
    for (int i = 0; i < _games.length; i++) {
      loses[i]  = _games[i] - _wins[i];
    }
    return loses;
  }

  List<int> get games {
    return _games;
  }

  List<double> get winPercentages {
    List<double> winPercentages = new List(games.length);
    for (int i = 0; i < games.length; i++) {
      winPercentages[i] = wins[i].toDouble()/games[i].toDouble() * 100.0;
    }
    return winPercentages;
  }

  List<double> get losePercentages {
    List<double> losePercentages = new List(games.length);
    for (int i = 0; i < games.length; i++) {
      losePercentages[i] = loses[i].toDouble()/games[i].toDouble() * 100.0;
    }
    return losePercentages;
  }

  int get totalWins {
    return wins.fold(0, (int acc, int e) => acc + e);
  }

  int get totalLoses {
    return loses.fold(0, (int acc, int e) => acc + e);
  }

  int get totalGames {
    return games.fold(0, (int acc, int e) => acc + e);
  }

  double get totalWinPercentage {
    return totalWins.toDouble()/totalGames.toDouble() * 100.0;
  }

  double get totalLosePercentage {
    return totalLoses.toDouble()/totalGames.toDouble() * 100.0;
  }

  List<int> get landedShoots {
    return _landedShoots;
  }

  List<int> get missedShoots {
    List<int> missedShoots = new List(_shoots.length);
    for (int i = 0; i < _shoots.length; i++) {
      missedShoots[i]  = _shoots[i] - _landedShoots[i];
    }
    return missedShoots;
  }

  List<int> get shoots {
    return _shoots;
  }

  List<double> get landedShootsPercentages {
    List<double> landedShootsPercentages = new List(shoots.length);
    for (int i = 0; i < shoots.length; i++) {
      landedShootsPercentages[i] = landedShoots[i].toDouble()/shoots[i].toDouble() * 100.0;
    }
    return landedShootsPercentages;
  }

  List<double> get missedShootsPercentages {
    List<double> missedShootsPercentages = new List(shoots.length);
    for (int i = 0; i < shoots.length; i++) {
      missedShootsPercentages[i] = missedShoots[i].toDouble()/shoots[i].toDouble() * 100.0;
    }
    return losePercentages;
  }

  int get totalLandedShoots {
    return landedShoots.fold(0, (int acc, int e) => acc + e);
  }

  int get totalMissedShoots {
    return missedShoots.fold(0, (int acc, int e) => acc + e);
  }

  int get totalShoots {
    return shoots.fold(0, (int acc, int e) => acc + e);
  }

  double get totalLandedShootPercentage {
    return totalLandedShoots.toDouble()/totalShoots.toDouble() * 100.0;
  }

  double get totalMissedShootPercentage {
    return totalMissedShoots.toDouble()/totalShoots.toDouble() * 100.0;
  }

  List<double> get distances {
    return _distances;
  }

  double get totalDistance {
    return distances.fold(0.0, (double acc, double e) => acc + e);
  }
}