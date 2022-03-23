// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:frc_scouting_app/Team.dart';

// Future<String?> getTeamName(int number) async {
//   final response = await http.get(
//       Uri.parse("https://www.thebluealliance.com/api/v3/teams/$number"),
//       headers: {"X-TBA-Auth-Key": "fpvx6eITkHpFy5Lnn6YewutoTl838FrHCviTeUpJQyni3V5pkPDhu4nfa1p4I2Wu"}
//   );
//
//   if(response.statusCode == 200) {
//     return Team.fromJson((jsonDecode(response.body)));
//   } else {
//     return null;
//   }
// }

// Future<List<Event>> getEvents(int year) async {
//   defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = "fpvx6eITkHpFy5Lnn6YewutoTl838FrHCviTeUpJQyni3V5pkPDhu4nfa1p4I2Wu";
//   EventApi event = EventApi(defaultApiClient);
//   try {
//     List<Event> response = await event.getEventsByYear(year);
//     return response;
//   }
//   catch (e) {
//     return [];
//   }
// }