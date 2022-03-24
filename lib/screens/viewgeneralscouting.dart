import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frc_scouting_app/team.dart';
import 'package:frc_scouting_app/widgets.dart';

class ViewGeneralScouting extends StatefulWidget {
  Team team;
  ViewGeneralScouting({Key? key, required this.team}) : super(key: key);

  @override
  State<ViewGeneralScouting> createState() => _ViewGeneralScoutingState(team);
}

class _ViewGeneralScoutingState extends State<ViewGeneralScouting> {
  Team team;
  bool enabled = false;
  _ViewGeneralScoutingState(this.team);

  @override
  Widget build(BuildContext context) {
    String filler = "FRC Team ${team.key?.substring(3)} -";

    return Scaffold(
      appBar: AppBar(
        title: Text("${team.nickname} Statistics and Scouting Info"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 2,
        children: [
          GriddedCardEntry(
            text: "Hubs Shot At",
            onTap: () {
              openInfoDialogueBox(context, "$filler Hubs Shot At", "[insert firebase call]");
            },
            message: "Hubs the Robot Shoots at"
          ),
          GriddedCardEntry(
            text: "ok1",
            onTap: () {
              openInfoDialogueBox(context, "ok1", "hola");
            },
            message: ""
          ),
          GriddedCardEntry(
            text: "ok2",
            onTap: () {
              openInfoDialogueBox(context, "ok2", "hola");
            },
            message: ""
          ),
          GriddedCardEntry(
            text: "ok3",
            onTap: () {
              openInfoDialogueBox(context, "ok3", "hola");
            },
            message: ""
          )
        ],
      ),
    );
  }
}
