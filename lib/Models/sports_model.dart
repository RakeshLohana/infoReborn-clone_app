class Sports {
  String? key;
  String? group;
  String? title;
  String? description;
  bool? active;
  bool? hasOutrights;

  Sports(
      {this.key,
      this.group,
      this.title,
      this.description,
      this.active,
      this.hasOutrights});

  Sports.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    group = json['group'];
    title = json['title'];
    description = json['description'];
    active = json['active'];
    hasOutrights = json['has_outrights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['group'] = this.group;
    data['title'] = this.title;
    data['description'] = this.description;
    data['active'] = this.active;
    data['has_outrights'] = this.hasOutrights;
    return data;
  }
}