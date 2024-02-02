class SportsScores {
  String? id;
  String? sportKey;
  String? sportTitle;
  String? commenceTime;
  bool? completed;
  String? homeTeam;
  String? awayTeam;
  Null? scores;
  Null? lastUpdate;

  SportsScores(
      {this.id,
      this.sportKey,
      this.sportTitle,
      this.commenceTime,
      this.completed,
      this.homeTeam,
      this.awayTeam,
      this.scores,
      this.lastUpdate});

  SportsScores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportKey = json['sport_key'];
    sportTitle = json['sport_title'];
    commenceTime = json['commence_time'];
    completed = json['completed'];
    homeTeam = json['home_team'];
    awayTeam = json['away_team'];
    scores = json['scores'];
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sport_key'] = this.sportKey;
    data['sport_title'] = this.sportTitle;
    data['commence_time'] = this.commenceTime;
    data['completed'] = this.completed;
    data['home_team'] = this.homeTeam;
    data['away_team'] = this.awayTeam;
    data['scores'] = this.scores;
    data['last_update'] = this.lastUpdate;
    return data;
  }
}