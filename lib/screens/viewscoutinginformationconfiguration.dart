import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting_app/backend/api.dart';
import 'package:frc_scouting_app/constants.dart';
import 'package:frc_scouting_app/models/event.dart';
import 'package:frc_scouting_app/screens/viewgeneralscouting.dart';
import 'package:frc_scouting_app/team.dart';

class ViewScoutingInfoConfiguration extends StatefulWidget {
  Event? event;
  ViewScoutingInfoConfiguration({Key? key}) : super(key: key);

  @override
  State<ViewScoutingInfoConfiguration> createState() =>
      _ViewScoutingInfoConfigurationState();
}

class _ViewScoutingInfoConfigurationState
    extends State<ViewScoutingInfoConfiguration> {
  final TextEditingController _teamNameController = TextEditingController();
  List<Team> _teamList = [];
  List<Widget> _foundTeams = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) => _generateTeams());
  }

  Future<void> _openScoutingScreen(BuildContext context, Team team) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ViewGeneralScouting(team: team)));
  }

  void _generateTeams() async {
    List<Widget> out = [];

    _teamList = await getTeamsFromEvent(widget.event?.key ?? "");

    for (Team team in _teamList) {
      Widget avatarImage;
      try {
        if ((team.avatar ?? "") == "") {
          avatarImage = Image.memory(base64Decode(baseAvatar));
        } else {
          base64Decode(team.avatar!);
          avatarImage = Image.memory(base64Decode(team.avatar!));
        }
      } catch (e) {
        avatarImage = Image.memory(base64Decode(baseAvatar));
      }

      out.add(Container(
        child: InkWell(
          child: ListTile(
            title: Text("${team.nickname ?? "No Name"} - ${team.city}, ${team.stateProv}"),
            leading: avatarImage,
            onTap: () {
              _openScoutingScreen(context, team);
            },
          ),
        ),
      ));
    }

    setState(() {
      _foundTeams = out;
    });
  }

  void _updateTeams() async {
    List<Widget> out = [];

    for (Team team in _teamList) {
      if (team.nickname!
          .toLowerCase()
          .contains(_teamNameController.value.text.toLowerCase())) {
        out.add(Container(
          child: InkWell(
            child: ListTile(
              title: Text(team.nickname ?? "No Name"),
              onTap: () {
                _openScoutingScreen(context, team);
              },
            ),
          ),
        ));
      }
    }

    setState(() {
      _foundTeams = out;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scouting View"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: TextFormField(
                    controller: _teamNameController,
                    onChanged: (s) async {
                      _updateTeams();
                      setState(() {});
                    },
                    decoration:
                        const InputDecoration(labelText: "Enter Team Name"),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    children: _foundTeams,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
