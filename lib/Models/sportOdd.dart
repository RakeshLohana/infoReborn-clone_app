class SportsOdds {
  String? id;
  String? sportKey;
  String? sportTitle;
  String? commenceTime;
  String? homeTeam;
  String? awayTeam;
  List<Bookmakers>? bookmakers;

  SportsOdds(
      {this.id,
      this.sportKey,
      this.sportTitle,
      this.commenceTime,
      this.homeTeam,
      this.awayTeam,
      this.bookmakers});

  SportsOdds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportKey = json['sport_key'];
    sportTitle = json['sport_title'];
    commenceTime = json['commence_time'];
    homeTeam = json['home_team'];
    awayTeam = json['away_team'];
    if (json['bookmakers'] != null) {
      bookmakers = <Bookmakers>[];
      json['bookmakers'].forEach((v) {
        bookmakers!.add(new Bookmakers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sport_key'] = this.sportKey;
    data['sport_title'] = this.sportTitle;
    data['commence_time'] = this.commenceTime;
    data['home_team'] = this.homeTeam;
    data['away_team'] = this.awayTeam;
    if (this.bookmakers != null) {
      data['bookmakers'] = this.bookmakers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookmakers {
  String? key;
  String? title;
  String? lastUpdate;
  List<Markets>? markets;

  Bookmakers({this.key, this.title, this.lastUpdate, this.markets});

  Bookmakers.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    lastUpdate = json['last_update'];
    if (json['markets'] != null) {
      markets = <Markets>[];
      json['markets'].forEach((v) {
        markets!.add(new Markets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['title'] = this.title;
    data['last_update'] = this.lastUpdate;
    if (this.markets != null) {
      data['markets'] = this.markets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Markets {
  String? key;
  String? lastUpdate;
  List<Outcomes>? outcomes;

  Markets({this.key, this.lastUpdate, this.outcomes});

  Markets.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    lastUpdate = json['last_update'];
    if (json['outcomes'] != null) {
      outcomes = <Outcomes>[];
      json['outcomes'].forEach((v) {
        outcomes!.add(new Outcomes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['last_update'] = this.lastUpdate;
    if (this.outcomes != null) {
      data['outcomes'] = this.outcomes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Outcomes {
  String? name;
  double? price;

  Outcomes({this.name, this.price});

  Outcomes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}