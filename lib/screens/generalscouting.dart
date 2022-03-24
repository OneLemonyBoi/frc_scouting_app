import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:frc_scouting_app/team.dart';
import 'package:frc_scouting_app/widgets/BooleanListTile.dart';
import 'package:frc_scouting_app/widgets/DropdownListTile.dart';
import 'package:frc_scouting_app/widgets/NumberListTile.dart';

class GeneralScouting extends StatefulWidget {
  Team team;
  GeneralScouting({Key? key, required this.team}) : super(key: key);

  @override
  State<GeneralScouting> createState() => _GeneralScoutingState(team);
}

class _GeneralScoutingState extends State<GeneralScouting> {
  Map<String, dynamic> scoutingInfo = {
    "target": null,
    "shooting-percentage": null,
    "shooting-range": null,
    "intake-system": null,
    "max-climb": null,
    "max-auto-balls": null,
    "taxi": false,
    "speed": null,
    "drivebase": null,
    "defensive": false,
    "width": null,
    "height": null,
    "weight": null,
    "language": null,
  };
  Team team;
  bool enabled = false;
  _GeneralScoutingState(this.team);

  Future<void> addToDatabase(bool enabled) async {
    print(scoutingInfo.toString());
    if (!enabled) {
      FirebaseFirestore.instance
          .collection("2022camb")
          .doc("${widget.team.teamNumber}")
          .set(scoutingInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${team.nickname}"),
        actions: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.175),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    enabled = !enabled;
                  });
                  addToDatabase(enabled);
                },
                child: SvgPicture.asset(
                    "assets/${enabled ? "un" : ""}locked.svg")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['target'] = value;
                  },
                  name: "Hubs Shot At",
                  choices: const ["Lower", "Upper", "Neither", "Both"]),
              color: Colors.black54,
            ),
            Container(
              child: NumberListTile(
                  callback: (double value) {
                    scoutingInfo['shooting-percentage'] = value;
                  },
                  enabled: enabled,
                  name: "Shooting Percentage"),
              color: Colors.red.shade300,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['shooting-range'] = value;
                    return value;
                  },
                  name: "Shooting Range",
                  choices: const [
                    "None",
                    "Fender",
                    "Line",
                    "Within Line Area",
                    "Anywhere"
                  ]),
              color: Colors.black54,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['intake-system'] = value;
                    return value;
                  },
                  name: "Intake System",
                  choices: const ["None", "Human Player", "Robot", "Both"]),
              color: Colors.red.shade300,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['max-climb'] = value;
                    return value;
                  },
                  name: "Maximum Climb",
                  choices: const ["None", "Low", "Mid", "High", "Traversal"]),
              color: Colors.black54,
            ),
            Container(
              child: NumberListTile(
                callback: (double value) {
                  scoutingInfo['max-auto-balls'] = value;
                },
                enabled: enabled,
                name: "Maximum Balls in Autonomous",
              ),
              color: Colors.red.shade300,
            ),
            Container(
              child: BooleanListTile(
                  enabled: enabled,
                  callback: (bool value) {
                    scoutingInfo['taxi'] = value;
                  },
                  name: "Robot Taxi"),
              color: Colors.black54,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['speed'] = value;
                    return value;
                  },
                  name: "Robot Speed",
                  choices: const ["Slow", "Medium", "Fast", "Blazing Fast"]),
              color: Colors.red.shade300,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['drivebase'] = value;

                    return value;
                  },
                  name: "Robot Drivebase",
                  choices: const [
                    "Tank",
                    "Mechanum",
                    "Swerve",
                    "H-Drive",
                    "Insect Drive",
                    "Kiwi Drive",
                    "X-Drive"
                  ]),
              color: Colors.black54,
            ),
            Container(
              child: BooleanListTile(
                  callback: (bool value) {
                    scoutingInfo['defensive'] = value;
                  },
                  enabled: enabled,
                  name: "Robot is Defensive"),
              color: Colors.red.shade300,
            ),
            Container(
              child: NumberListTile(
                  callback: (double value) {
                    scoutingInfo['width'] = value;
                  },
                  enabled: enabled,
                  name: "Robot Width"),
              color: Colors.black54,
            ),
            Container(
              child: NumberListTile(
                callback: (double value) {
                  scoutingInfo['height'] = value;
                },
                enabled: enabled,
                name: "Robot Height",
              ),
              color: Colors.red.shade300,
            ),
            Container(
              child: NumberListTile(
                callback: (double value) {
                  scoutingInfo['weight'] = value;
                },
                enabled: enabled,
                name: "Robot Weight",
              ),
              color: Colors.black54,
            ),
            Container(
              child: StringDropDown(
                  enabled: enabled,
                  callback: (String value) {
                    scoutingInfo['language'] = value;
                  },
                  name: "Programming Language",
                  choices: const ["Java", "C/C++", "Labview", "Python"]),
              color: Colors.red.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
