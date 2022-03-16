import 'package:tba_api_client/api.dart';

Future<String> getTeamName(int number) async {
  defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = "fpvx6eITkHpFy5Lnn6YewutoTl838FrHCviTeUpJQyni3V5pkPDhu4nfa1p4I2Wu";
  TeamApi team = TeamApi(defaultApiClient);
  try {
    Team response = await team.getTeam("frc$number");
    return "${response.nickname} (${response.city}, ${response.stateProv})";
  }
  catch (e) {
    return "No Team Found";
  }
}

Future<List<Event>> getEvents(int year) async {
  defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = "fpvx6eITkHpFy5Lnn6YewutoTl838FrHCviTeUpJQyni3V5pkPDhu4nfa1p4I2Wu";
  EventApi event = EventApi(defaultApiClient);
  try {
    List<Event> response = await event.getEventsByYear(year);
    return response;
  }
  catch (e) {
    return [];
  }
}