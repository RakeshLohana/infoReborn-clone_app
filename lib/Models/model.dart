class SportsResponse {
  final List<Sport> sports;

  SportsResponse({required this.sports});

  factory SportsResponse.fromJson(List<dynamic> json) {
    List<Sport> sports = json.map((item) => Sport.fromJson(item)).toList();
    return SportsResponse(sports: sports);
  }
}

class Sport {
  final String key;
  final String group;
  final String title;
  final String description;
  final bool active;
  final bool hasOutrights;

  Sport({
    required this.key,
    required this.group,
    required this.title,
    required this.description,
    required this.active,
    required this.hasOutrights,
  });

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      key: json['key'],
      group: json['group'],
      title: json['title'],
      description: json['description'],
      active: json['active'],
      hasOutrights: json['has_outrights'],
    );
  }
}
