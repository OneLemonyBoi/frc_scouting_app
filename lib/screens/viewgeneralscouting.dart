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

  Map<String, List<String>> fancyDetails = {
    "target": ["Hubs Shot At", "The hubs shot at by the robot/human"],
    "shooting-percentage": ["Shooting Percentage", "The approximate shooting percentage of the robot/human"],
    "shooting-range": ["Shooting Range", "The shooting range of the robot"],
    "intake-system": ["Intake System", "If intake is done by robot or human player"],
    "max-climb": ["Maximum Climb", "The maximum potential climb for the robot"],
    "max-auto-balls": ["Maximum Ball Auto", "The maximum amount of balls shot in auto"],
    "taxi": ["Taxi", "If the robot can taxi"],
    "speed": ["Speed", "The speed of the robot"],
    "drivebase": ["Drivebase", "The drivebase of the robt"],
    "defensive": ["Defensive", "If the robot is defensive"],
    "width": ["Robot Width", "Width of the robot's base"],
    "height": ["Robot Height", "Height of the robot's base"],
    "weight":  ["Robot Weight", "Weight of the robot"],
    "language": ["Robot Programming Language", "The robot's programming language"],
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

    return Scaffold(
        appBar: AppBar(
          title: Text(filler),
        ),
        body: teamInfo.isNotEmpty
            ? !loading
                ? GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 13,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (ctx, i) {
                      String tooltip = fancyDetails.keys.contains(teamInfo.keys.toList()[i]) ? fancyDetails[teamInfo.keys.toList()[i]]![1] as String : teamInfo.keys.toList()[i];
                      String title = fancyDetails.keys.contains(teamInfo.keys.toList()[i]) ? fancyDetails[teamInfo.keys.toList()[i]]![0] as String : teamInfo.keys.toList()[i];
                      bool disabled = teamInfo.values.toList()[i] == null;

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
                          child: InkWell(
                            onTap: !disabled ? () {
                              openInfoDialogueBox(
                                  context,
                                  "$filler - $title",
                                  "${teamInfo.values.toList()[i]}");
                            } : null,
                            child: Center(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const CircularProgressIndicator()
            : const Center(
                child: Text("This team is yet to be scouted!"),
              )

        // GridView.count(
        //   crossAxisCount: 2,
        //   childAspectRatio: 2,
        //   children: [
        //     GriddedCardEntry(
        //         text: "Hubs Shot At",
        //         onTap: () {
        //           openInfoDialogueBox(
        //               context, "$filler Hubs Shot At", "[insert firebase call]");
        //         },
        //         message: "Hubs the Robot Shoots at"),
        //     GriddedCardEntry(
        //         text: "ok1",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok1", "hola");
        //         },
        //         message: ""),
        //     GriddedCardEntry(
        //         text: "ok2",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok2", "hola");
        //         },
        //         message: ""),
        //     GriddedCardEntry(
        //         text: "ok3",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok3", "hola");
        //         },
        //         message: "")
        //   ],
        // ),
        );
  }
}
