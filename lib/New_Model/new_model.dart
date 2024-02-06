// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
    List<Response>? response;
    bool? success;

    EventsModel({
        this.response,
        this.success,
    });

    factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
        "success": success,
    };
}

class Response {
    List<ActiveEvent>? activeEvents;
    String? source;
    String? sportName;

    Response({
        this.activeEvents,
        this.source,
        this.sportName,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        activeEvents: json["active events"] == null ? [] : List<ActiveEvent>.from(json["active events"]!.map((x) => ActiveEvent.fromJson(x))),
        source: json["source"],
        sportName: json["sport name"],
    );

    Map<String, dynamic> toJson() => {
        "active events": activeEvents == null ? [] : List<dynamic>.from(activeEvents!.map((x) => x.toJson())),
        "source": source,
        "sport name": sportName,
    };
}

class ActiveEvent {
    String? eventKey;
    String? title;

    ActiveEvent({
        this.eventKey,
        this.title,
    });

    factory ActiveEvent.fromJson(Map<String, dynamic> json) => ActiveEvent(
        eventKey: json["event_key"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "event_key": eventKey,
        "title": title,
    };
}
