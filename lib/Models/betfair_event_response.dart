// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    int success;
    List<Result> results;

    Welcome({
        required this.success,
        required this.results,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Event event;
    String updatedAt;
    List<MarketElement> markets;
    String marketsUpdatedAt;

    Result({
        required this.event,
        required this.updatedAt,
        required this.markets,
        required this.marketsUpdatedAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        event: Event.fromJson(json["event"]),
        updatedAt: json["updated_at"],
        markets: List<MarketElement>.from(json["markets"].map((x) => MarketElement.fromJson(x))),
        marketsUpdatedAt: json["markets_updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "event": event.toJson(),
        "updated_at": updatedAt,
        "markets": List<dynamic>.from(markets.map((x) => x.toJson())),
        "markets_updated_at": marketsUpdatedAt,
    };
}

class Event {
    String timezone;
    DateTime openDate;
    int competitionId;
    String countryCode;
    int eventId;
    bool videoAvailable;
    int eventTypeId;
    String name;
    String key;

    Event({
        required this.timezone,
        required this.openDate,
        required this.competitionId,
        required this.countryCode,
        required this.eventId,
        required this.videoAvailable,
        required this.eventTypeId,
        required this.name,
        required this.key,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        timezone: json["timezone"],
        openDate: DateTime.parse(json["openDate"]),
        competitionId: json["competitionId"],
        countryCode: json["countryCode"],
        eventId: json["eventId"],
        videoAvailable: json["videoAvailable"],
        eventTypeId: json["eventTypeId"],
        name: json["name"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "openDate": openDate.toIso8601String(),
        "competitionId": competitionId,
        "countryCode": countryCode,
        "eventId": eventId,
        "videoAvailable": videoAvailable,
        "eventTypeId": eventTypeId,
        "name": name,
        "key": key,
    };
}

class MarketElement {
    List<Runner> runners;
    MarketState state;
    bool isMarketDataDelayed;
    MarketDescription description;
    bool isMarketDataVirtual;
    Rates rates;
    String marketId;
    MarketMarket market;
    LineRangeInfo? lineRangeInfo;

    MarketElement({
        required this.runners,
        required this.state,
        required this.isMarketDataDelayed,
        required this.description,
        required this.isMarketDataVirtual,
        required this.rates,
        required this.marketId,
        required this.market,
        this.lineRangeInfo,
    });

    factory MarketElement.fromJson(Map<String, dynamic> json) => MarketElement(
        runners: List<Runner>.from(json["runners"].map((x) => Runner.fromJson(x))),
        state: MarketState.fromJson(json["state"]),
        isMarketDataDelayed: json["isMarketDataDelayed"],
        description: MarketDescription.fromJson(json["description"]),
        isMarketDataVirtual: json["isMarketDataVirtual"],
        rates: Rates.fromJson(json["rates"]),
        marketId: json["marketId"],
        market: MarketMarket.fromJson(json["market"]),
        lineRangeInfo: json["lineRangeInfo"] == null ? null : LineRangeInfo.fromJson(json["lineRangeInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "runners": List<dynamic>.from(runners.map((x) => x.toJson())),
        "state": state.toJson(),
        "isMarketDataDelayed": isMarketDataDelayed,
        "description": description.toJson(),
        "isMarketDataVirtual": isMarketDataVirtual,
        "rates": rates.toJson(),
        "marketId": marketId,
        "market": market.toJson(),
        "lineRangeInfo": lineRangeInfo?.toJson(),
    };
}

class MarketDescription {
    bool persistenceEnabled;
    PriceLadderDescription priceLadderDescription;
    DateTime marketTime;
    String marketName;
    BettingType bettingType;
    bool bspMarket;
    DateTime suspendTime;
    bool turnInPlayEnabled;
    String marketType;

    MarketDescription({
        required this.persistenceEnabled,
        required this.priceLadderDescription,
        required this.marketTime,
        required this.marketName,
        required this.bettingType,
        required this.bspMarket,
        required this.suspendTime,
        required this.turnInPlayEnabled,
        required this.marketType,
    });

    factory MarketDescription.fromJson(Map<String, dynamic> json) => MarketDescription(
        persistenceEnabled: json["persistenceEnabled"],
        priceLadderDescription: PriceLadderDescription.fromJson(json["priceLadderDescription"]),
        marketTime: DateTime.parse(json["marketTime"]),
        marketName: json["marketName"],
        bettingType: bettingTypeValues.map[json["bettingType"]]!,
        bspMarket: json["bspMarket"],
        suspendTime: DateTime.parse(json["suspendTime"]),
        turnInPlayEnabled: json["turnInPlayEnabled"],
        marketType: json["marketType"],
    );

    Map<String, dynamic> toJson() => {
        "persistenceEnabled": persistenceEnabled,
        "priceLadderDescription": priceLadderDescription.toJson(),
        "marketTime": marketTime.toIso8601String(),
        "marketName": marketName,
        "bettingType": bettingTypeValues.reverse[bettingType],
        "bspMarket": bspMarket,
        "suspendTime": suspendTime.toIso8601String(),
        "turnInPlayEnabled": turnInPlayEnabled,
        "marketType": marketType,
    };
}

enum BettingType {
    ASIAN_HANDICAP_SINGLE_LINE,
    LINE,
    ODDS
}

final bettingTypeValues = EnumValues({
    "ASIAN_HANDICAP_SINGLE_LINE": BettingType.ASIAN_HANDICAP_SINGLE_LINE,
    "LINE": BettingType.LINE,
    "ODDS": BettingType.ODDS
});

class PriceLadderDescription {
    Type type;

    PriceLadderDescription({
        required this.type,
    });

    factory PriceLadderDescription.fromJson(Map<String, dynamic> json) => PriceLadderDescription(
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
    };
}

enum Type {
    CLASSIC,
    FINEST,
    LINE_RANGE
}

final typeValues = EnumValues({
    "CLASSIC": Type.CLASSIC,
    "FINEST": Type.FINEST,
    "LINE_RANGE": Type.LINE_RANGE
});

class LineRangeInfo {
    int interval;
    double maxUnitValue;
    MarketUnit marketUnit;
    double minUnitValue;

    LineRangeInfo({
        required this.interval,
        required this.maxUnitValue,
        required this.marketUnit,
        required this.minUnitValue,
    });

    factory LineRangeInfo.fromJson(Map<String, dynamic> json) => LineRangeInfo(
        interval: json["interval"],
        maxUnitValue: json["maxUnitValue"]?.toDouble(),
        marketUnit: marketUnitValues.map[json["marketUnit"]]!,
        minUnitValue: json["minUnitValue"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "interval": interval,
        "maxUnitValue": maxUnitValue,
        "marketUnit": marketUnitValues.reverse[marketUnit],
        "minUnitValue": minUnitValue,
    };
}

enum MarketUnit {
    RUNS
}

final marketUnitValues = EnumValues({
    "Runs": MarketUnit.RUNS
});

class MarketMarket {
    String marketType;
    ProductType productType;
    int numberOfActiveRunners;
    bool canTurnInPlay;
    MarketStatusEnum marketStatus;
    String marketName;
    int numberOfRunners;
    List<MarketLevel> marketLevels;
    DateTime marketTime;
    double totalAvailable;
    int competitionId;
    int upperLevelEventId;
    int eventTypeId;
    String marketId;
    bool inplay;
    int numberOfUpperLevels;
    int topLevelEventId;
    String key;
    double totalMatched;
    int eventId;
    int numberOfWinners;
    List<dynamic> associatedMarkets;

    MarketMarket({
        required this.marketType,
        required this.productType,
        required this.numberOfActiveRunners,
        required this.canTurnInPlay,
        required this.marketStatus,
        required this.marketName,
        required this.numberOfRunners,
        required this.marketLevels,
        required this.marketTime,
        required this.totalAvailable,
        required this.competitionId,
        required this.upperLevelEventId,
        required this.eventTypeId,
        required this.marketId,
        required this.inplay,
        required this.numberOfUpperLevels,
        required this.topLevelEventId,
        required this.key,
        required this.totalMatched,
        required this.eventId,
        required this.numberOfWinners,
        required this.associatedMarkets,
    });

    factory MarketMarket.fromJson(Map<String, dynamic> json) => MarketMarket(
        marketType: json["marketType"],
        productType: productTypeValues.map[json["productType"]]!,
        numberOfActiveRunners: json["numberOfActiveRunners"],
        canTurnInPlay: json["canTurnInPlay"],
        marketStatus: marketStatusEnumValues.map[json["marketStatus"]]!,
        marketName: json["marketName"],
        numberOfRunners: json["numberOfRunners"],
        marketLevels: List<MarketLevel>.from(json["marketLevels"].map((x) => marketLevelValues.map[x]!)),
        marketTime: DateTime.parse(json["marketTime"]),
        totalAvailable: json["totalAvailable"]?.toDouble(),
        competitionId: json["competitionId"],
        upperLevelEventId: json["upperLevelEventId"],
        eventTypeId: json["eventTypeId"],
        marketId: json["marketId"],
        inplay: json["inplay"],
        numberOfUpperLevels: json["numberOfUpperLevels"],
        topLevelEventId: json["topLevelEventId"],
        key: json["key"],
        totalMatched: json["totalMatched"]?.toDouble(),
        eventId: json["eventId"],
        numberOfWinners: json["numberOfWinners"],
        associatedMarkets: List<dynamic>.from(json["associatedMarkets"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "marketType": marketType,
        "productType": productTypeValues.reverse[productType],
        "numberOfActiveRunners": numberOfActiveRunners,
        "canTurnInPlay": canTurnInPlay,
        "marketStatus": marketStatusEnumValues.reverse[marketStatus],
        "marketName": marketName,
        "numberOfRunners": numberOfRunners,
        "marketLevels": List<dynamic>.from(marketLevels.map((x) => marketLevelValues.reverse[x])),
        "marketTime": marketTime.toIso8601String(),
        "totalAvailable": totalAvailable,
        "competitionId": competitionId,
        "upperLevelEventId": upperLevelEventId,
        "eventTypeId": eventTypeId,
        "marketId": marketId,
        "inplay": inplay,
        "numberOfUpperLevels": numberOfUpperLevels,
        "topLevelEventId": topLevelEventId,
        "key": key,
        "totalMatched": totalMatched,
        "eventId": eventId,
        "numberOfWinners": numberOfWinners,
        "associatedMarkets": List<dynamic>.from(associatedMarkets.map((x) => x)),
    };
}

enum MarketLevel {
    AVB_EVENT
}

final marketLevelValues = EnumValues({
    "AVB_EVENT": MarketLevel.AVB_EVENT
});

enum MarketStatusEnum {
    OPEN
}

final marketStatusEnumValues = EnumValues({
    "OPEN": MarketStatusEnum.OPEN
});

enum ProductType {
    EXCHANGE
}

final productTypeValues = EnumValues({
    "EXCHANGE": ProductType.EXCHANGE
});

class Rates {
    int marketBaseRate;
    bool discountAllowed;

    Rates({
        required this.marketBaseRate,
        required this.discountAllowed,
    });

    factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        marketBaseRate: json["marketBaseRate"],
        discountAllowed: json["discountAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "marketBaseRate": marketBaseRate,
        "discountAllowed": discountAllowed,
    };
}

class Runner {
    int handicap;
    int selectionId;
    RunnerDescription description;
    RunnerState state;
    dynamic exchange;

    Runner({
        required this.handicap,
        required this.selectionId,
        required this.description,
        required this.state,
        required this.exchange,
    });

    factory Runner.fromJson(Map<String, dynamic> json) => Runner(
        handicap: json["handicap"],
        selectionId: json["selectionId"],
        description: RunnerDescription.fromJson(json["description"]),
        state: RunnerState.fromJson(json["state"]),
        exchange: json["exchange"],
    );

    Map<String, dynamic> toJson() => {
        "handicap": handicap,
        "selectionId": selectionId,
        "description": description.toJson(),
        "state": state.toJson(),
        "exchange": exchange,
    };
}

class RunnerDescription {
    Metadata metadata;
    String runnerName;

    RunnerDescription({
        required this.metadata,
        required this.runnerName,
    });

    factory RunnerDescription.fromJson(Map<String, dynamic> json) => RunnerDescription(
        metadata: Metadata.fromJson(json["metadata"]),
        runnerName: json["runnerName"],
    );

    Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "runnerName": runnerName,
    };
}

class Metadata {
    String runnerId;

    Metadata({
        required this.runnerId,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        runnerId: json["runnerId"],
    );

    Map<String, dynamic> toJson() => {
        "runnerId": runnerId,
    };
}

class ExchangeClass {
    List<AvailableTo>? availableToLay;
    List<AvailableTo>? availableToBack;

    ExchangeClass({
        this.availableToLay,
        this.availableToBack,
    });

    factory ExchangeClass.fromJson(Map<String, dynamic> json) => ExchangeClass(
        availableToLay: json["availableToLay"] == null ? [] : List<AvailableTo>.from(json["availableToLay"]!.map((x) => AvailableTo.fromJson(x))),
        availableToBack: json["availableToBack"] == null ? [] : List<AvailableTo>.from(json["availableToBack"]!.map((x) => AvailableTo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "availableToLay": availableToLay == null ? [] : List<dynamic>.from(availableToLay!.map((x) => x.toJson())),
        "availableToBack": availableToBack == null ? [] : List<dynamic>.from(availableToBack!.map((x) => x.toJson())),
    };
}

class AvailableTo {
    double size;
    double price;

    AvailableTo({
        required this.size,
        required this.price,
    });

    factory AvailableTo.fromJson(Map<String, dynamic> json) => AvailableTo(
        size: json["size"]?.toDouble(),
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "size": size,
        "price": price,
    };
}

class RunnerState {
    int? totalMatched;
    int sortPriority;
    double? lastPriceTraded;
    PurpleStatus status;

    RunnerState({
        this.totalMatched,
        required this.sortPriority,
        this.lastPriceTraded,
        required this.status,
    });

    factory RunnerState.fromJson(Map<String, dynamic> json) => RunnerState(
        totalMatched: json["totalMatched"],
        sortPriority: json["sortPriority"],
        lastPriceTraded: json["lastPriceTraded"]?.toDouble(),
        status: purpleStatusValues.map[json["status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "totalMatched": totalMatched,
        "sortPriority": sortPriority,
        "lastPriceTraded": lastPriceTraded,
        "status": purpleStatusValues.reverse[status],
    };
}

enum PurpleStatus {
    ACTIVE
}

final purpleStatusValues = EnumValues({
    "ACTIVE": PurpleStatus.ACTIVE
});

class MarketState {
    bool complete;
    int betDelay;
    int numberOfRunners;
    double totalMatched;
    DateTime? lastMatchTime;
    int numberOfWinners;
    bool runnersVoidable;
    double totalAvailable;
    bool crossMatching;
    int numberOfActiveRunners;
    bool bspReconciled;
    MarketStatusEnum status;
    bool inplay;
    int version;

    MarketState({
        required this.complete,
        required this.betDelay,
        required this.numberOfRunners,
        required this.totalMatched,
        this.lastMatchTime,
        required this.numberOfWinners,
        required this.runnersVoidable,
        required this.totalAvailable,
        required this.crossMatching,
        required this.numberOfActiveRunners,
        required this.bspReconciled,
        required this.status,
        required this.inplay,
        required this.version,
    });

    factory MarketState.fromJson(Map<String, dynamic> json) => MarketState(
        complete: json["complete"],
        betDelay: json["betDelay"],
        numberOfRunners: json["numberOfRunners"],
        totalMatched: json["totalMatched"]?.toDouble(),
        lastMatchTime: json["lastMatchTime"] == null ? null : DateTime.parse(json["lastMatchTime"]),
        numberOfWinners: json["numberOfWinners"],
        runnersVoidable: json["runnersVoidable"],
        totalAvailable: json["totalAvailable"]?.toDouble(),
        crossMatching: json["crossMatching"],
        numberOfActiveRunners: json["numberOfActiveRunners"],
        bspReconciled: json["bspReconciled"],
        status: marketStatusEnumValues.map[json["status"]]!,
        inplay: json["inplay"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "complete": complete,
        "betDelay": betDelay,
        "numberOfRunners": numberOfRunners,
        "totalMatched": totalMatched,
        "lastMatchTime": lastMatchTime?.toIso8601String(),
        "numberOfWinners": numberOfWinners,
        "runnersVoidable": runnersVoidable,
        "totalAvailable": totalAvailable,
        "crossMatching": crossMatching,
        "numberOfActiveRunners": numberOfActiveRunners,
        "bspReconciled": bspReconciled,
        "status": marketStatusEnumValues.reverse[status],
        "inplay": inplay,
        "version": version,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
