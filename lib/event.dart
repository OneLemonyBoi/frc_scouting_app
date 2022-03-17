class Event {
  /* TBA event key with the format yyyy[EVENT_CODE], where yyyy is the year, and EVENT_CODE is the event code of the event. */
  String? key;
  /* Official name of event on record either provided by FIRST or organizers of offseason event. */
  String? name;
  /* Event short code, as provided by FIRST. */
  String? eventCode;
  String? city;
  /* State or Province the event is located in. */
  String? stateProv;
  /* Country the event is located in. */
  String? country;
  /* Event start date in `yyyy-mm-dd` format. */
  DateTime? startDate;
  /* Event end date in `yyyy-mm-dd` format. */
  DateTime? endDate;
  /* Year the event data is for. */
  int? year;
  /* Same as `name` but doesn't include event specifiers, such as 'Regional' or 'District'. May be null. */
  String? shortName;
  /* Event Type, eg Regional, District, or Offseason. */
  String? eventTypeString;
  /* Week of the event relative to the first official season event, zero-indexed. Only valid for Regionals, Districts, and District Championships. Null otherwise. (Eg. A season with a week 0 'preseason' event does not count, and week 1 events will show 0 here. Seasons with a week 0.5 regional event will show week 0 for those event(s) and week 1 for week 1 events and so on.) */
  int? week;
  /* Address of the event's venue, if available. */
  String? address;
  /* Postal code from the event address. */
  String? postalCode;
  /* Link to address location on Google Maps. */
  String? gmapsUrl;
  /* Latitude for the event address. */
  double? lat;
  /* Longitude for the event address. */
  double? lng;
  /* Name of the location at the address for the event, eg. Blue Alliance High School. */
  String? locationName;
  /* Timezone name. */
  String? timezone;
  /* Public facing event code used by FIRST (on frc-events.firstinspires.org, for example) */
  String? firstEventCode;
  /* An array of event keys for the divisions at this event. */
  List<String>? divisionKeys = [];
  /* The TBA Event key that represents the event's parent. Used to link back to the event from a division event. It is also the inverse relation of `divison_keys`. */
  String? parentEventKey;
  /* Playoff Type, as defined here: https://github.com/the-blue-alliance/the-blue-alliance/blob/master/consts/playoff_type.py#L4, or null. */
  int? playoffType;
  /* String representation of the `playoff_type`, or null. */
  String? playoffTypeString;


  Event(this.key, this.name, this.eventCode, this.city, this.stateProv, this.country, this.startDate, this.endDate, this.year, this.shortName, this.eventTypeString, this.week, this.address, this.postalCode, this.gmapsUrl, this.lat, this.lng, this.locationName, this.timezone, this.firstEventCode, this.divisionKeys, this.parentEventKey, this.playoffType, this.playoffTypeString);


  @override
  String toString() {
    return 'Event[key=$key, name=$name, eventCode=$eventCode, city=$city, stateProv=$stateProv, country=$country, startDate=$startDate, endDate=$endDate, year=$year, shortName=$shortName, eventTypeString=$eventTypeString, week=$week, address=$address, postalCode=$postalCode, gmapsUrl=$gmapsUrl, lat=$lat, lng=$lng, locationName=$locationName, timezone=$timezone, firstEventCode=$firstEventCode, divisionKeys=$divisionKeys, parentEventKey=$parentEventKey, playoffType=$playoffType, playoffTypeString=$playoffTypeString]';
  }

  Event.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    key = json['key'];
    name = json['name'];
    eventCode = json['event_code'];
    city = json['city'];
    stateProv = json['state_prov'];
    country = json['country'];
    year = json['year'];
    shortName = json['short_name'];
    eventTypeString = json['event_type_string'];
    week = json['week'];
    address = json['address'];
    postalCode = json['postal_code'];
    gmapsUrl = json['gmaps_url'];
    lat = (json['lat'] == null) ? null : json['lat'].toDouble();
    lng = (json['lng'] == null) ? null : json['lng'].toDouble();
    locationName = json['location_name'];
    timezone = json['timezone'];
    firstEventCode = json['first_event_code'];
    parentEventKey = json['parent_event_key'];
    playoffType = json['playoff_type'];
    playoffTypeString = json['playoff_type_string'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (key != null)
      json['key'] = key;
    if (name != null)
      json['name'] = name;
    if (eventCode != null)
      json['event_code'] = eventCode;
    if (city != null)
      json['city'] = city;
    if (stateProv != null)
      json['state_prov'] = stateProv;
    if (country != null)
      json['country'] = country;
    if (startDate != null)
      json['start_date'] = startDate == null ? null : startDate!.toUtc().toIso8601String();
    if (endDate != null)
      json['end_date'] = endDate == null ? null : endDate!.toUtc().toIso8601String();
    if (year != null)
      json['year'] = year;
    if (shortName != null)
      json['short_name'] = shortName;
    if (eventTypeString != null)
      json['event_type_string'] = eventTypeString;
    if (week != null)
      json['week'] = week;
    if (address != null)
      json['address'] = address;
    if (postalCode != null)
      json['postal_code'] = postalCode;
    if (gmapsUrl != null)
      json['gmaps_url'] = gmapsUrl;
    if (lat != null)
      json['lat'] = lat;
    if (lng != null)
      json['lng'] = lng;
    if (locationName != null)
      json['location_name'] = locationName;
    if (timezone != null)
      json['timezone'] = timezone;
    if (firstEventCode != null)
      json['first_event_code'] = firstEventCode;
    if (divisionKeys != null)
      json['division_keys'] = divisionKeys;
    if (parentEventKey != null)
      json['parent_event_key'] = parentEventKey;
    if (playoffType != null)
      json['playoff_type'] = playoffType;
    if (playoffTypeString != null)
      json['playoff_type_string'] = playoffTypeString;
    return json;
  }

  static List<Event> listFromJson(List<dynamic> json) {
    return json == null ? <Event>[] : json.map((value) => Event.fromJson(value)).toList();
  }

  static Map<String, Event> mapFromJson(Map<String, dynamic> json) {
    var map = <String, Event>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Event.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Event-objects as value to a dart map
  static Map<String, List<Event>> mapListFromJson(Map<String, dynamic> json) {
    var map = <String, List<Event>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = Event.listFromJson(value);
      });
    }
    return map;
  }
}