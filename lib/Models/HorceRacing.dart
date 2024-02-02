// To parse this JSON data, do
//
//     final horseRacing = horseRacingFromJson(jsonString);

import 'dart:convert';

HorseRacing horseRacingFromJson(String str) => HorseRacing.fromJson(json.decode(str));

String horseRacingToJson(HorseRacing data) => json.encode(data.toJson());

class HorseRacing {
    int success;
    Pager pager;
    List<Result> results;

    HorseRacing({
        required this.success,
        required this.pager,
        required this.results,
    });

    factory HorseRacing.fromJson(Map<String, dynamic> json) => HorseRacing(
        success: json["success"],
        pager: Pager.fromJson(json["pager"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "pager": pager.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Pager {
    int page;
    int perPage;
    int total;

    Pager({
        required this.page,
        required this.perPage,
        required this.total,
    });

    factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
    };
}

class Result {
    String id;
    String sportId;
    String time;
    String timeStatus;
    Home league;
    Home home;
    dynamic away;
    dynamic ss;
    String ourEventId;
    dynamic rId;
    String updatedAt;
    Extra extra;

    Result({
        required this.id,
        required this.sportId,
        required this.time,
        required this.timeStatus,
        required this.league,
        required this.home,
        required this.away,
        required this.ss,
        required this.ourEventId,
        required this.rId,
        required this.updatedAt,
        required this.extra,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        sportId: json["sport_id"],
        time: json["time"],
        timeStatus: json["time_status"],
        league: Home.fromJson(json["league"]),
        home: Home.fromJson(json["home"]),
        away: json["away"],
        ss: json["ss"],
        ourEventId: json["our_event_id"],
        rId: json["r_id"],
        updatedAt: json["updated_at"],
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "time": time,
        "time_status": timeStatus,
        "league": league.toJson(),
        "home": home.toJson(),
        "away": away,
        "ss": ss,
        "our_event_id": ourEventId,
        "r_id": rId,
        "updated_at": updatedAt,
        "extra": extra.toJson(),
    };
}

class Extra {
    String n;

    Extra({
        required this.n,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        n: json["n"],
    );

    Map<String, dynamic> toJson() => {
        "n": n,
    };
}

class Home {
    String id;
    String name;

    Home({
        required this.id,
        required this.name,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
