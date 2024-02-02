class HorseRaceWin {
  int? success;
  List<Results>? results;

  HorseRaceWin({this.success, this.results});

  HorseRaceWin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? fI;
  String? eventId;
  Main? main;

  Results({this.fI, this.eventId, this.main});

  Results.fromJson(Map<String, dynamic> json) {
    fI = json['FI'];
    eventId = json['event_id'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FI'] = this.fI;
    data['event_id'] = this.eventId;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    return data;
  }
}

class Main {
  String? updatedAt;
  String? key;
  Sp? sp;

  Main({this.updatedAt, this.key, this.sp});

  Main.fromJson(Map<String, dynamic> json) {
    updatedAt = json['updated_at'];
    key = json['key'];
    sp = json['sp'] != null ? new Sp.fromJson(json['sp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated_at'] = this.updatedAt;
    data['key'] = this.key;
    if (this.sp != null) {
      data['sp'] = this.sp!.toJson();
    }
    return data;
  }
}

class Sp {
  WinEachWay? winEachWay;

  Sp({this.winEachWay});

  Sp.fromJson(Map<String, dynamic> json) {
    winEachWay = json['win_each_way'] != null
        ? new WinEachWay.fromJson(json['win_each_way'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.winEachWay != null) {
      data['win_each_way'] = this.winEachWay!.toJson();
    }
    return data;
  }
}

class WinEachWay {
  List<Odds>? odds;

  WinEachWay({this.odds});

  WinEachWay.fromJson(Map<String, dynamic> json) {
    if (json['odds'] != null) {
      odds = <Odds>[];
      json['odds'].forEach((v) {
        odds!.add(new Odds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.odds != null) {
      data['odds'] = this.odds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Odds {
  String? nA;
  String? iD;
  String? fI;
  String? nF;
  String? jN;
  String? tN;
  String? fO;
  String? oD;
  String? oH;
  String? sI;
  String? hY;
  String? sN;
  String? sU;
  String? hW;
  String? hI;
  String? fL;
  String? eW;
  String? bS;
  String? sF;
  String? rD;
  String? dI;
  String? oR;
  String? pN;
  String? eP;
  String? fW;
  String? s3W;
  String? eM;
  String? sA;

  Odds(
      {this.nA,
      this.iD,
      this.fI,
      this.nF,
      this.jN,
      this.tN,
      this.fO,
      this.oD,
      this.oH,
      this.sI,
      this.hY,
      this.sN,
      this.sU,
      this.hW,
      this.hI,
      this.fL,
      this.eW,
      this.bS,
      this.sF,
      this.rD,
      this.dI,
      this.oR,
      this.pN,
      this.eP,
      this.fW,
      this.s3W,
      this.eM,
      this.sA});

  Odds.fromJson(Map<String, dynamic> json) {
    nA = json['NA'];
    iD = json['ID'];
    fI = json['FI'];
    nF = json['NF'];
    jN = json['JN'];
    tN = json['TN'];
    fO = json['FO'];
    oD = json['OD'];
    oH = json['OH'];
    sI = json['SI'];
    hY = json['HY'];
    sN = json['SN'];
    sU = json['SU'];
    hW = json['HW'];
    hI = json['HI'];
    fL = json['FL'];
    eW = json['EW'];
    bS = json['BS'];
    sF = json['SF'];
    rD = json['RD'];
    dI = json['DI'];
    oR = json['OR'];
    pN = json['PN'];
    eP = json['EP'];
    fW = json['FW'];
    s3W = json['3W'];
    eM = json['EM'];
    sA = json['SA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NA'] = this.nA;
    data['ID'] = this.iD;
    data['FI'] = this.fI;
    data['NF'] = this.nF;
    data['JN'] = this.jN;
    data['TN'] = this.tN;
    data['FO'] = this.fO;
    data['OD'] = this.oD;
    data['OH'] = this.oH;
    data['SI'] = this.sI;
    data['HY'] = this.hY;
    data['SN'] = this.sN;
    data['SU'] = this.sU;
    data['HW'] = this.hW;
    data['HI'] = this.hI;
    data['FL'] = this.fL;
    data['EW'] = this.eW;
    data['BS'] = this.bS;
    data['SF'] = this.sF;
    data['RD'] = this.rD;
    data['DI'] = this.dI;
    data['OR'] = this.oR;
    data['PN'] = this.pN;
    data['EP'] = this.eP;
    data['FW'] = this.fW;
    data['3W'] = this.s3W;
    data['EM'] = this.eM;
    data['SA'] = this.sA;
    return data;
  }
}