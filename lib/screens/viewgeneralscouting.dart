import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frc_scouting_app/team.dart';
import 'package:frc_scouting_app/widgets.dart';

class ViewGeneralScouting extends StatefulWidget {
  Team team;
  ViewGeneralScouting({Key? key, required this.team}) : super(key: key);

  @override
  State<ViewGeneralScouting> createState() => _ViewGeneralScoutingState();
}

class _ViewGeneralScoutingState extends State<ViewGeneralScouting> {
  bool enabled = false;
  Map<String, dynamic> teamInfo = {};
  bool loading = true;

  // Name: [Long Name, Information, Suffix]
  Map<String, List<String>> formatMap = {
    "target": ["Hubs Shot At", "The hubs shot at by the robot/human", " Hub(s)"],
    "shooting-range": ["Shooting Range", "The shooting range of the robot", ""],
    "max-climb": ["Maximum Climb", "The maximum potential climb for the robot", ""],
    "intake-system": ["Intake System", "If intake is done by robot or human player"],
    "max-auto-balls": ["Maximum Ball Auto", "The maximum amount of balls shot in auto", " Balls"],
    "taxi": ["Taxi", "If the robot can taxi", ""],
    "speed": ["Speed", "The speed of the robot", ""],
    "drivebase": ["Drivebase", "The drivebase of the robot", ""],
    "defensive": ["Defensive Specialist", "If the robot specializes in defensive", ""],
    "width": ["Robot Width", "Width of the robot's base", " Inches"],
    "height": ["Robot Height", "Height of the robot's base", "Inches"],
    "weight":  ["Robot Weight", "Weight of the robot", "Pounds"],
    "language": ["Robot Programming Language", "The robot's programming language", ""],
  };

  Future<void> getTeamData() async {
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection('2022camb')
        .doc("${widget.team.teamNumber}")
        .get();
    if (ds.data() != null) {
      setState(() {
        teamInfo = ds.data() as Map<String, dynamic>;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getTeamData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String filler = "FRC Team ${widget.team.key?.substring(3)}";
    List infoList = teamInfo.keys.toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(filler),
        ),
        body: teamInfo.isNotEmpty
            ? !loading
                ? GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 12,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (ctx, i) {
                      var infoName = infoList[i];
                      String tooltip = formatMap.keys.contains(infoName) ? formatMap[infoName]![1] : infoName;
                      String title = formatMap.keys.contains(infoName) ? formatMap[infoName]![0] : infoName;
                      bool disabled = infoName == null;

                      return Tooltip(
                        message: tooltip,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.circular(10000000000000)),
                        preferBelow: false,
                        verticalOffset: 20,
                        child: Card(
                          color: disabled ? Colors.black12 : Colors.white,
                          child: Center(
                            child: Text(
                              "$title - ${teamInfo[infoName]}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    })
                : const CircularProgressIndicator()
            : const Center(
                child: Text("This team is yet to be scouted!"),
              )
        );
  }
}
