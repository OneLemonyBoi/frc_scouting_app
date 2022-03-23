import 'package:flutter/material.dart';
import 'package:frc_scouting_app/screens/competitionselection.dart';
import 'package:frc_scouting_app/screens/generalscoutingconfiguration.dart';
import 'package:frc_scouting_app/screens/homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => ScouterHomePage());
      case "/scouting/general/config":
        return MaterialPageRoute(
            builder: (context) => GeneralScoutingConfiguration());
      case "/competition":
        return MaterialPageRoute(
            builder: (context) => const CompetitionSelection());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
