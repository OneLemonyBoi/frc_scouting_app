class Team {
  /* TBA team key with the format `frcXXXX` with `XXXX` representing the team number. */
  String? key;
  /* Official team number issued by FIRST. */
  int? teamNumber;
  /* Team nickname provided by FIRST. */
  String? nickname;
  /* Official long name registered with FIRST. */
  String? name;
  /* Name of team school or affilited group registered with FIRST. */
  String? schoolName;
  /* City of team derived from parsing the address registered with FIRST. */
  String? city;
  /* State of team derived from parsing the address registered with FIRST. */
  String? stateProv;
  /* Country of team derived from parsing the address registered with FIRST. */
  String? locationName;
  /* Official website associated with the team. */
  String? website;
  /* First year the team officially competed. */
  int? rookieYear;

  Team(this.key, this.teamNumber, this.nickname, this.name, this.schoolName, this.city, this.stateProv, this.locationName, this.website, this.rookieYear);

  @override
  String toString() {
    return 'Team[key=$key, teamNumber=$teamNumber, nickname=$nickname, name=$name, schoolName=$schoolName, city=$city, stateProv=$stateProv, locationName=$locationName, website=$website, rookieYear=$rookieYear]';
  }

  Team.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    teamNumber = json['team_number'];
    nickname = json['nickname'];
    name = json['name'];
    schoolName = json['school_name'];
    city = json['city'];
    stateProv = json['state_prov'];
    locationName = json['location_name'];
    website = json['website'];
    rookieYear = json['rookie_year'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (key != null)
      json['key'] = key;
    if (teamNumber != null)
      json['team_number'] = teamNumber;
    if (nickname != null)
      json['nickname'] = nickname;
    if (name != null)
      json['name'] = name;
    if (schoolName != null)
      json['school_name'] = schoolName;
    if (city != null)
      json['city'] = city;
    if (stateProv != null)
      json['state_prov'] = stateProv;
    if (locationName != null)
      json['location_name'] = locationName;
    if (website != null)
      json['website'] = website;
    if (rookieYear != null)
      json['rookie_year'] = rookieYear;
    return json;
  }

  static List<Team> listFromJson(List<dynamic> json) {
    return json == null ? <Team>[] : json.map((value) => Team.fromJson(value)).toList();
  }

  static Map<String, Team> mapFromJson(Map<String, dynamic> json) {
    var map = <String, Team>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Team.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Team-objects as value to a dart map
  static Map<String, List<Team>> mapListFromJson(Map<String, dynamic> json) {
    var map = <String, List<Team>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) {
        map[key] = Team.listFromJson(value);
      });
    }
    return map;
  }
}