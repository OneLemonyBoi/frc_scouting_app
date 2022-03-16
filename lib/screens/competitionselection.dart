import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frc_scouting_app/constants.dart';
import 'package:frc_scouting_app/globals.dart';
import 'package:frc_scouting_app/requests.dart';
import 'package:tba_api_client/api.dart';

class CompetitionSelection extends StatefulWidget {
  const CompetitionSelection({Key? key}) : super(key: key);

  @override
  State<CompetitionSelection> createState() => _CompetitionSelectionState();
}

class _CompetitionSelectionState extends State<CompetitionSelection> {
  List<Event>? events;
  Event? _dropdownSelected;

  @override
  void initState() {
    eventList();
    super.initState();
  }

  Future<void> eventList() async {
    events = await getEvents(Constants.year);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Event Below",
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: DropdownButton<Event>(
                items: events?.map((e) => DropdownMenuItem<Event>(
                    child: Text(e.shortName),
                    value: e,
                )).toList(),
                onChanged: (Event? e) {
                  setState(() {
                    _dropdownSelected = e;
                  });
                },
                value: _dropdownSelected,
              ),
            ),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                Globals.currentEvent = _dropdownSelected;
                Navigator.pushReplacementNamed(context, "/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
