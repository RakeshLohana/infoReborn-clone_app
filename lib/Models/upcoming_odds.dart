class UpcomingEvent {
  final int success;
  final Pager pager;
  final List<Event> results;

  UpcomingEvent({
    required this.success,
    required this.pager,
    required this.results,
  });

  factory UpcomingEvent.fromJson(Map<String, dynamic> json) {
    final pager = Pager.fromJson(json['pager']);
    final results = (json['results'] as List).map((event) => Event.fromJson(event)).toList();

    return UpcomingEvent(
      success: json['success'],
      pager: pager,
      results: results,
    );
  }
}

class Pager {
  final int page;
  final int perPage;
  final int total;

  Pager({
    required this.page,
    required this.perPage,
    required this.total,
  });

  factory Pager.fromJson(Map<String, dynamic> json) {
    return Pager(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
    );
  }
}

class Event {
  final String id;
  final String sportId;
  final String time;
  final String timeStatus;
  final League league;
  final Team home;
  final Team away;
  final String ourEventId;

  Event({
    required this.id,
    required this.sportId,
    required this.time,
    required this.timeStatus,
    required this.league,
    required this.home,
    required this.away,
    required this.ourEventId,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final league = League.fromJson(json['league']);
    final home = Team.fromJson(json['home']);
    final away = Team.fromJson(json['away']);

    return Event(
      id: json['id'],
      sportId: json['sport_id'],
      time: json['time'],
      timeStatus: json['time_status'],
      league: league,
      home: home,
      away: away,
      ourEventId: json['our_event_id'],
    );
  }
}

class League {
  final String id;
  final String name;

  League({
    required this.id,
    required this.name,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Team {
  final String id;
  final String name;

  Team({
    required this.id,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
    );
  }
}
