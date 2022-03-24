class Event {
  String key;
  String name;
  String country;
  String state;
  String city;

  Event(this.key, this.name, this.country, this.state, this.city);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(json['key'], json['name'], json['country'], json['state'],
        json['city']);
  }
}
