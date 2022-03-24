import 'dart:convert';

import 'package:frc_scouting_app/team.dart';
import 'package:http/http.dart' as http;

const tbaApiURL = "https://www.thebluealliance.com/api/v3";
const firstApiURL = "https://frc-api.firstinspires.org/v3.0";
const tbaHeaders = {
  "X-TBA-Auth-Key":
      "mDm6jblvJCQSiPB9KyhPvav1iURKTaPveDjT7Npyypozl7ZkUFAdvftfHmbDdeKI"
};
const firstHeaders = {
  "Authorization":
  "Basic b25lbGVtb255Ym9pOmM4NjE4NmE0LWE3NzktNGM1OC04YjE2LTgxNjhiOGQ3NDgyNw=="
};

// Future<List<Event>> getAllEvents() async {
//   final response =
//       await http.get(Uri.parse("$apiURL/events/2022"), headers: headers);

//   final responseList = jsonDecode(response.body);
//   if (response.statusCode == 200) {
//     return Event.listFromJson(responseList);
//   } else {
//     throw Exception("There was an error");
//   }
// }

Future<Team> getTeam(int teamNumber) async {
  final response = await http.get(Uri.parse("$tbaApiURL/team/frc$teamNumber"),
      headers: tbaHeaders);
  if (response.statusCode == 200) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("There was an error");
  }
}
Future<List<Team>> getTeamsFromEvent(String eventName) async {
  final response = await http.get(Uri.parse("$tbaApiURL/event/$eventName/teams"),
      headers: tbaHeaders);
  if (response.statusCode == 200) {
    Map<int, String> avatarMap = await getTeamAvatarsFromEvent(eventName.substring(4));
    List<Team> teams = Team.listFromJson(jsonDecode(response.body));
    for (Team element in teams) {
      element.avatar = avatarMap[element.teamNumber];
    }
    return teams;
  } else {
    throw Exception("There was an error");
  }
}

Future<Map<int, String>> getTeamAvatarsFromEvent(String eventName) async {
  final response = await http.get(Uri.parse("$firstApiURL/2022/avatars?eventCode=$eventName"), headers: firstHeaders);
  if (response.statusCode == 200) {
    dynamic json = jsonDecode(response.body);
    Map<int, String> avatars = {};
    for (dynamic team in json['teams']) {
      avatars.addAll({
        team['teamNumber']: team['encodedAvatar']
      });
    }

    return avatars;
  }
  else {
    throw Exception("There was an error");
  }
}