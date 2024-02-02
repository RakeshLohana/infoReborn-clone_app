// // To parse this JSON data, do
// //
// //     final horseData = horseDataFromJson(jsonString);

// import 'dart:convert';

// HorseData horseDataFromJson(String str) => HorseData.fromJson(json.decode(str));

// String horseDataToJson(HorseData data) => json.encode(data.toJson());

// class HorseData {
//     int success;
//     List<Result> results;

//     HorseData({
//         required this.success,
//         required this.results,
//     });

//     factory HorseData.fromJson(Map<String, dynamic> json) => HorseData(
//         success: json["success"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Result {
//     String fi;
//     String eventId;
//     Main main;

//     Result({
//         required this.fi,
//         required this.eventId,
//         required this.main,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         fi: json["FI"],
//         eventId: json["event_id"],
//         main: Main.fromJson(json["main"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "FI": fi,
//         "event_id": eventId,
//         "main": main.toJson(),
//     };
// }

// class Main {
//     String updatedAt;
//     String key;
//     Sp sp;

//     Main({
//         required this.updatedAt,
//         required this.key,
//         required this.sp,
//     });

//     factory Main.fromJson(Map<String, dynamic> json) => Main(
//         updatedAt: json["updated_at"],
//         key: json["key"],
//         sp: Sp.fromJson(json["sp"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "updated_at": updatedAt,
//         "key": key,
//         "sp": sp.toJson(),
//     };
// }

// class Sp {
//     WinEachWay winEachWay;

//     Sp({
//         required this.winEachWay,
//     });

//     factory Sp.fromJson(Map<String, dynamic> json) => Sp(
//         winEachWay: WinEachWay.fromJson(json["win_each_way"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "win_each_way": winEachWay.toJson(),
//     };
// }

// class WinEachWay {
//     List<Odd> odds;

//     WinEachWay({
//         required this.odds,
//     });

//     factory WinEachWay.fromJson(Map<String, dynamic> json) => WinEachWay(
//         odds: List<Odd>.from(json["odds"].map((x) => Odd.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "odds": List<dynamic>.from(odds.map((x) => x.toJson())),
//     };
// }

// class Odd {
//     String na;
//     String id;
//     String fi;
//     String nf;
//     String? jn;
//     String? tn;
//     String? fo;
//     String od;
//     String oh;
//     String? si;
//     String? hy;
//     String? sn;
//     String? su;
//     String? hw;
//     String? hi;
//     String fl;
//     String? ew;
//     String? bs;
//     String? sf;
//     String? rd;
//     String? di;
//     String or;
//     String pn;
//     String? ep;
//     String? fw;
//     String? the3W;
//     String? em;
//     String? sa;

//     Odd({
//         required this.na,
//         required this.id,
//         required this.fi,
//         required this.nf,
//         this.jn,
//         this.tn,
//         this.fo,
//         required this.od,
//         required this.oh,
//         this.si,
//         this.hy,
//         this.sn,
//         this.su,
//         this.hw,
//         this.hi,
//         required this.fl,
//         this.ew,
//         this.bs,
//         this.sf,
//         this.rd,
//         this.di,
//         required this.or,
//         required this.pn,
//         this.ep,
//         this.fw,
//         this.the3W,
//         this.em,
//         this.sa,
//     });

//     factory Odd.fromJson(Map<String, dynamic> json) => Odd(
//         na: json["NA"],
//         id: json["ID"],
//         fi: json["FI"],
//         nf: json["NF"],
//         jn: json["JN"],
//         tn: json["TN"],
//         fo: json["FO"],
//         od: json["OD"],
//         oh: json["OH"],
//         si: json["SI"],
//         hy: json["HY"],
//         sn: json["SN"],
//         su: json["SU"],
//         hw: json["HW"],
//         hi: json["HI"],
//         fl: json["FL"],
//         ew: json["EW"],
//         bs: json["BS"],
//         sf: json["SF"],
//         rd: json["RD"],
//         di: json["DI"],
//         or: json["OR"],
//         pn: json["PN"],
//         ep: json["EP"],
//         fw: json["FW"],
//         the3W: json["3W"],
//         em: json["EM"],
//         sa: json["SA"],
//     );

//     Map<String, dynamic> toJson() => {
//         "NA": na,
//         "ID": id,
//         "FI": fi,
//         "NF": nf,
//         "JN": jn,
//         "TN": tn,
//         "FO": fo,
//         "OD": od,
//         "OH": oh,
//         "SI": si,
//         "HY": hy,
//         "SN": sn,
//         "SU": su,
//         "HW": hw,
//         "HI": hi,
//         "FL": fl,
//         "EW": ew,
//         "BS": bs,
//         "SF": sf,
//         "RD": rd,
//         "DI": di,
//         "OR": or,
//         "PN": pn,
//         "EP": ep,
//         "FW": fw,
//         "3W": the3W,
//         "EM": em,
//         "SA": sa,
//     };
// }



// To parse this JSON data, do
//
//     final horseData = horseDataFromJson(jsonString);

// import 'dart:convert';

// HorseDataOdds horseDataFromJson(String str) => HorseDataOdds.fromJson(json.decode(str));

// String horseDataToJson(HorseDataOdds data) => json.encode(data.toJson());

// class HorseDataOdds {
//     int success;
//     List<Result> results;

//     HorseDataOdds({
//         required this.success,
//         required this.results,
//     });

//     factory HorseDataOdds.fromJson(Map<String, dynamic> json) => HorseDataOdds(
//         success: json["success"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Result {
//     String fi;
//     String eventId;
//     Main main;

//     Result({
//         required this.fi,
//         required this.eventId,
//         required this.main,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         fi: json["FI"],
//         eventId: json["event_id"],
//         main: Main.fromJson(json["main"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "FI": fi,
//         "event_id": eventId,
//         "main": main.toJson(),
//     };
// }

// class Main {
//     String updatedAt;
//     String key;
//     Sp sp;

//     Main({
//         required this.updatedAt,
//         required this.key,
//         required this.sp,
//     });

//     factory Main.fromJson(Map<String, dynamic> json) => Main(
//         updatedAt: json["updated_at"],
//         key: json["key"],
//         sp: Sp.fromJson(json["sp"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "updated_at": updatedAt,
//         "key": key,
//         "sp": sp.toJson(),
//     };
// }

// class Sp {
//     Fixed fixed;

//     Sp({
//         required this.fixed,
//     });

//     factory Sp.fromJson(Map<String, dynamic> json) => Sp(
//         fixed: Fixed.fromJson(json["fixed"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "fixed": fixed.toJson(),
//     };
// }

// class Fixed {
//     List<Odd> odds;

//     Fixed({
//         required this.odds,
//     });

//     factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
//         odds: List<Odd>.from(json["odds"].map((x) => Odd.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "odds": List<dynamic>.from(odds.map((x) => x.toJson())),
//     };
// }

// class Odd {
//     String id;
//     String or;
//     String na;
//     String su;
//     String fi;
//     String nf;
//     String di;
//     String pn;
//     String sn;
//     String si;
//     String jn;
//     String tn;
//     String fo;
//     String hy;
//     String hw;
//     String sf;
//     String rd;
//     String hi;
//     String ps;
//     String rs;
//     String oh;
//     Fp fw;
//     Fp fp;
//     Sa sa;
//     String ep;

//     Odd({
//         required this.id,
//         required this.or,
//         required this.na,
//         required this.su,
//         required this.fi,
//         required this.nf,
//         required this.di,
//         required this.pn,
//         required this.sn,
//         required this.si,
//         required this.jn,
//         required this.tn,
//         required this.fo,
//         required this.hy,
//         required this.hw,
//         required this.sf,
//         required this.rd,
//         required this.hi,
//         required this.ps,
//         required this.rs,
//         required this.oh,
//         required this.fw,
//         required this.fp,
//         required this.sa,
//         required this.ep,
//     });

//     factory Odd.fromJson(Map<String, dynamic> json) => Odd(
//         id: json["ID"],
//         or: json["OR"],
//         na: json["NA"],
//         su: json["SU"],
//         fi: json["FI"],
//         nf: json["NF"],
//         di: json["DI"],
//         pn: json["PN"],
//         sn: json["SN"],
//         si: json["SI"],
//         jn: json["JN"],
//         tn: json["TN"],
//         fo: json["FO"],
//         hy: json["HY"],
//         hw: json["HW"],
//         sf: json["SF"],
//         rd: json["RD"],
//         hi: json["HI"],
//         ps: json["PS"],
//         rs: json["RS"],
//         oh: json["OH"],
//         fw: fpValues.map[json["FW"]]!,
//         fp: fpValues.map[json["FP"]]!,
//         sa: saValues.map[json["SA"]]!,
//         ep: json["EP"],
//     );

//     Map<String, dynamic> toJson() => {
//         "ID": id,
//         "OR": or,
//         "NA": na,
//         "SU": su,
//         "FI": fi,
//         "NF": nf,
//         "DI": di,
//         "PN": pn,
//         "SN": sn,
//         "SI": si,
//         "JN": jn,
//         "TN": tn,
//         "FO": fo,
//         "HY": hy,
//         "HW": hw,
//         "SF": sf,
//         "RD": rd,
//         "HI": hi,
//         "PS": ps,
//         "RS": rs,
//         "OH": oh,
//         "FW": fpValues.reverse[fw],
//         "FP": fpValues.reverse[fp],
//         "SA": saValues.reverse[sa],
//         "EP": ep,
//     };
// }

// enum Fp {
//     SP
// }

// final fpValues = EnumValues({
//     "SP::::": Fp.SP
// });

// enum Sa {
//     THE_00
// }

// final saValues = EnumValues({
//     ",0,0": Sa.THE_00
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }

// To parse this JSON data, do
//
//     final horseDataOdds = horseDataOddsFromJson(jsonString);

// import 'dart:convert';

// HorseDataOdds horseDataOddsFromJson(String str) => HorseDataOdds.fromJson(json.decode(str));

// String horseDataOddsToJson(HorseDataOdds data) => json.encode(data.toJson());

// class HorseDataOdds {
//     int success;
//     List<Result> results;

//     HorseDataOdds({
//         required this.success,
//         required this.results,
//     });

//     factory HorseDataOdds.fromJson(Map<String, dynamic> json) => HorseDataOdds(
//         success: json["success"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Result {
//     String fi;
//     String eventId;
//     Main main;

//     Result({
//         required this.fi,
//         required this.eventId,
//         required this.main,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         fi: json["FI"],
//         eventId: json["event_id"],
//         main: Main.fromJson(json["main"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "FI": fi,
//         "event_id": eventId,
//         "main": main.toJson(),
//     };
// }

// class Main {
//     String updatedAt;
//     String key;
//     Sp sp;

//     Main({
//         required this.updatedAt,
//         required this.key,
//         required this.sp,
//     });

//     factory Main.fromJson(Map<String, dynamic> json) => Main(
//         updatedAt: json["updated_at"],
//         key: json["key"],
//         sp: Sp.fromJson(json["sp"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "updated_at": updatedAt,
//         "key": key,
//         "sp": sp.toJson(),
//     };
// }

// class Sp {
//     Fixed fixed;

//     Sp({
//         required this.fixed,
//     });

//     factory Sp.fromJson(Map<String, dynamic> json) => Sp(
//         fixed: Fixed.fromJson(json["fixed"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "fixed": fixed.toJson(),
//     };
// }

// class Fixed {
//     List<Odd> odds;

//     Fixed({
//         required this.odds,
//     });

//     factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
//         odds: List<Odd>.from(json["odds"].map((x) => Odd.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "odds": List<dynamic>.from(odds.map((x) => x.toJson())),
//     };
// }

// class Odd {
//     String id;
//     String or;
//     String na;
//     String su;
//     String fi;
//     String nf;
//     String di;
//     String pn;
//     String sn;
//     String si;
//     String jn;
//     String tn;
//     String fo;
//     String hy;
//     String hw;
//     String sf;
//     String rd;
//     String hi;
//     String oh;
//     String rs;
//     String fw;
//     String fp;
//     Sa sa;
//     String ep;

//     Odd({
//         required this.id,
//         required this.or,
//         required this.na,
//         required this.su,
//         required this.fi,
//         required this.nf,
//         required this.di,
//         required this.pn,
//         required this.sn,
//         required this.si,
//         required this.jn,
//         required this.tn,
//         required this.fo,
//         required this.hy,
//         required this.hw,
//         required this.sf,
//         required this.rd,
//         required this.hi,
//         required this.oh,
//         required this.rs,
//         required this.fw,
//         required this.fp,
//         required this.sa,
//         required this.ep,
//     });

//     factory Odd.fromJson(Map<String, dynamic> json) => Odd(
//         id: json["ID"],
//         or: json["OR"],
//         na: json["NA"],
//         su: json["SU"],
//         fi: json["FI"],
//         nf: json["NF"],
//         di: json["DI"],
//         pn: json["PN"],
//         sn: json["SN"],
//         si: json["SI"],
//         jn: json["JN"],
//         tn: json["TN"],
//         fo: json["FO"],
//         hy: json["HY"],
//         hw: json["HW"],
//         sf: json["SF"],
//         rd: json["RD"],
//         hi: json["HI"],
//         oh: json["OH"],
//         rs: json["RS"],
//         fw: json["FW"],
//         fp: json["FP"],
//         sa: saValues.map[json["SA"]]!,
//         ep: json["EP"],
//     );

//     Map<String, dynamic> toJson() => {
//         "ID": id,
//         "OR": or,
//         "NA": na,
//         "SU": su,
//         "FI": fi,
//         "NF": nf,
//         "DI": di,
//         "PN": pn,
//         "SN": sn,
//         "SI": si,
//         "JN": jn,
//         "TN": tn,
//         "FO": fo,
//         "HY": hy,
//         "HW": hw,
//         "SF": sf,
//         "RD": rd,
//         "HI": hi,
//         "OH": oh,
//         "RS": rs,
//         "FW": fw,
//         "FP": fp,
//         "SA": saValues.reverse[sa],
//         "EP": ep,
//     };
// }

// enum Sa {
//     THE_00
// }

// final saValues = EnumValues({
//     ",0,0": Sa.THE_00
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
// To parse this JSON data, do
//
//     final horseDataOddsFixed = horseDataOddsFixedFromJson(jsonString);

import 'dart:convert';

HorseDataOddsFixed horseDataOddsFixedFromJson(String str) => HorseDataOddsFixed.fromJson(json.decode(str));

String horseDataOddsFixedToJson(HorseDataOddsFixed data) => json.encode(data.toJson());

class HorseDataOddsFixed {
    int success;
    List<Result> results;

    HorseDataOddsFixed({
        required this.success,
        required this.results,
    });

    factory HorseDataOddsFixed.fromJson(Map<String, dynamic> json) => HorseDataOddsFixed(
        success: json["success"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String fi;
    String eventId;
    Main main;

    Result({
        required this.fi,
        required this.eventId,
        required this.main,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        fi: json["FI"],
        eventId: json["event_id"],
        main: Main.fromJson(json["main"]),
    );

    Map<String, dynamic> toJson() => {
        "FI": fi,
        "event_id": eventId,
        "main": main.toJson(),
    };
}

class Main {
    String updatedAt;
    String key;
    Sp sp;

    Main({
        required this.updatedAt,
        required this.key,
        required this.sp,
    });

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        updatedAt: json["updated_at"],
        key: json["key"],
        sp: Sp.fromJson(json["sp"]),
    );

    Map<String, dynamic> toJson() => {
        "updated_at": updatedAt,
        "key": key,
        "sp": sp.toJson(),
    };
}

class Sp {
    Fixed fixed;

    Sp({
        required this.fixed,
    });

    factory Sp.fromJson(Map<String, dynamic> json) => Sp(
        fixed: Fixed.fromJson(json["fixed"]),
    );

    Map<String, dynamic> toJson() => {
        "fixed": fixed.toJson(),
    };
}

class Fixed {
    List<Odd> odds;

    Fixed({
        required this.odds,
    });

    factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
        odds: List<Odd>.from(json["odds"].map((x) => Odd.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "odds": List<dynamic>.from(odds.map((x) => x.toJson())),
    };
}

class Odd {
    String id;
    String or;
    String na;
    String su;
    String fi;
    String nf;
    String di;
    String pn;
    String sn;
    String si;
    String jn;
    String tn;
    String fo;
    String hy;
    String hw;
    String sf;
    String rd;
    String hi;
    String oh;
    String rs;
    String fw;
    String fp;
    String sa;
    String ep;

    Odd({
        required this.id,
        required this.or,
        required this.na,
        required this.su,
        required this.fi,
        required this.nf,
        required this.di,
        required this.pn,
        required this.sn,
        required this.si,
        required this.jn,
        required this.tn,
        required this.fo,
        required this.hy,
        required this.hw,
        required this.sf,
        required this.rd,
        required this.hi,
        required this.oh,
        required this.rs,
        required this.fw,
        required this.fp,
        required this.sa,
        required this.ep,
    });

    factory Odd.fromJson(Map<String, dynamic> json) => Odd(
        id: json["ID"],
        or: json["OR"],
        na: json["NA"],
        su: json["SU"],
        fi: json["FI"],
        nf: json["NF"],
        di: json["DI"],
        pn: json["PN"],
        sn: json["SN"],
        si: json["SI"],
        jn: json["JN"],
        tn: json["TN"],
        fo: json["FO"],
        hy: json["HY"],
        hw: json["HW"],
        sf: json["SF"],
        rd: json["RD"],
        hi: json["HI"],
        oh: json["OH"],
        rs: json["RS"],
        fw: json["FW"],
        fp: json["FP"],
        sa: json["SA"],
        ep: json["EP"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "OR": or,
        "NA": na,
        "SU": su,
        "FI": fi,
        "NF": nf,
        "DI": di,
        "PN": pn,
        "SN": sn,
        "SI": si,
        "JN": jn,
        "TN": tn,
        "FO": fo,
        "HY": hy,
        "HW": hw,
        "SF": sf,
        "RD": rd,
        "HI": hi,
        "OH": oh,
        "RS": rs,
        "FW": fw,
        "FP": fp,
        "SA": sa,
        "EP": ep,
    };
}
