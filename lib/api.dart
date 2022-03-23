import 'dart:convert';

import 'package:frc_scouting_app/Team.dart';
import 'package:http/http.dart' as http;

const apiURL = "https://www.thebluealliance.com/api/v3";
const headers = {
  "X-TBA-Auth-Key":
      "mDm6jblvJCQSiPB9KyhPvav1iURKTaPveDjT7Npyypozl7ZkUFAdvftfHmbDdeKI"
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
  final response = await http.get(Uri.parse("$apiURL/team/frc$teamNumber"),
      headers: headers);
  if (response.statusCode == 200) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("There was an error");
  }
}
