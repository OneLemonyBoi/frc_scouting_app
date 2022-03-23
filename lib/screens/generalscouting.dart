import 'package:flutter/material.dart';
import 'package:frc_scouting_app/Team.dart';
import 'package:frc_scouting_app/widgets.dart';

class GeneralScouting extends StatefulWidget {
  Team team;
  GeneralScouting({Key? key, required this.team}) : super(key: key);

  @override
  State<GeneralScouting> createState() => _GeneralScoutingState(team);
}

class _GeneralScoutingState extends State<GeneralScouting> {
  Team team;
  _GeneralScoutingState(this.team);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${team.nickname}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "hubs_shot_at",
                    name: "Hubs Shot At",
                    choices: const ["None", "Lower", "Upper", "Both"]),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: team.teamNumber!,
                    id: "shooting_percentage",
                    name: "Shooting Percentage"),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "shooting_range",
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
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "intake_system",
                    name: "Intake System",
                    choices: ["None", "Human Player", "Robot", "Both"]),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "max_climb",
                    name: "Maximum Climb",
                    choices: ["None", "Low", "Mid", "High", "Traversal"]),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: team.teamNumber!,
                    id: "max_auto_balls",
                    name: "Maximum Balls in Autonomous",
                    min: 0,
                    max: 10,
                    acceleration: 0.1),
                color: Colors.red.shade300,
              ),
              Container(
                child: BooleanListTile(
                    team: team.teamNumber!,
                    id: "auto_tarmac",
                    name: "Robot leaves Tarmac during Autonomous"),
                color: Colors.black54,
              ),
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "speed",
                    name: "Robot Speed",
                    choices: ["Slow", "Medium", "Fast", "Blazing Fast"]),
                color: Colors.red.shade300,
              ),
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "drivebase",
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
                    team: team.teamNumber!,
                    id: "is_defensive",
                    name: "Robot is Defensive"),
                color: Colors.red.shade300,
              ),
              Container(
                child: NumberListTile(
                    team: team.teamNumber!,
                    id: "robot_width",
                    name: "Robot Width",
                    min: 1,
                    max: 40),
                color: Colors.black54,
              ),
              Container(
                child: NumberListTile(
                    team: team.teamNumber!,
                    id: "robot_height",
                    name: "Robot Height",
                    min: 1,
                    max: 40),
                color: Colors.red.shade300,
              ),
              Container(
                child: NumberListTile(
                    team: team.teamNumber!,
                    id: "robot_weight",
                    name: "Robot Weight",
                    min: 1,
                    max: 125,
                    acceleration: 0.3),
                color: Colors.black54,
              ),
              Container(
                child: DropdownListTile(
                    team: team.teamNumber!,
                    id: "language",
                    name: "Programming Language",
                    choices: const ["Java", "C/C++", "Labview", "Python"]),
                color: Colors.red.shade300,
              ),
              Container(
                child: ParagraphListTile(
                  team: team.teamNumber!,
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
