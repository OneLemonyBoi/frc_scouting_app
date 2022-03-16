import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frc_scouting_app/widgets.dart';

import '../constants.dart';
import '../globals.dart';

class GeneralScouting extends StatefulWidget {
  int teamID;
  GeneralScouting({Key? key, required this.teamID}) : super(key: key);

  @override
  State<GeneralScouting> createState() => _GeneralScoutingState();
}

class _GeneralScoutingState extends State<GeneralScouting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Scouting - FRC Team ${widget.teamID}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "hubs_shot_at",
                    name: "Hubs Shot At",
                    choices: ["None", "Lower", "Upper", "Both"]
                ),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: widget.teamID,
                    id: "shooting_percentage",
                    name: "Shooting Percentage"
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "shooting_range",
                    name: "Shooting Range",
                    choices: ["None", "Fender", "Line", "Within Line Area", "Anywhere"]
                ),
                color: Colors.black54,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "intake_system",
                    name: "Intake System",
                    choices: ["None", "Human Player", "Robot", "Both"]
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "max_climb",
                    name: "Maximum Climb",
                    choices: ["None", "Low", "Mid", "High", "Traversal"]
                ),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: widget.teamID,
                    id: "max_auto_balls",
                    name: "Maximum Balls in Autonomous", min: 0, max: 10, acceleration: 0.1
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: BooleanListTile(
                    team: widget.teamID,
                    id: "auto_tarmac",
                    name: "Robot leaves Tarmac during Autonomous"
                ),
                color: Colors.black54,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "speed",
                    name: "Robot Speed",
                    choices: ["Slow", "Medium", "Fast", "Blazing Fast"]
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "drivebase",
                    name: "Robot Drivebase",
                    choices: ["Tank", "Mechanum", "Swerve", "H-Drive", "Insect Drive", "Kiwi Drive", "X-Drive"]
                ),
                color: Colors.black54,
              ),
              Container(
                child: BooleanListTile(
                    team: widget.teamID,
                    id: "is_defensive",
                    name: "Robot is Defensive"
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: NumberListTile(
                    team: widget.teamID,
                    id: "robot_width",
                    name: "Robot Width", min: 1, max: 40
                ),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: widget.teamID,
                    id: "robot_height",
                    name: "Robot Height", min: 1, max: 40
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: NumberListTile(
                    team: widget.teamID,
                    id: "robot_weight",
                    name: "Robot Weight", min: 1, max: 125, acceleration: 0.3
                ),
                color: Colors.black54,
              ),
              Container(
                child: DropdownListTile(
                    team: widget.teamID,
                    id: "language",
                    name: "Programming Language",
                    choices: ["Java", "C/C++", "Labview", "Python"]
                ),
                color: Colors.red.shade300,
              ),
              Container(
                child: ParagraphListTile(
                  team: widget.teamID,
                  id: "comments",
                  label: "Enter Additional Comments",
                ),
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
