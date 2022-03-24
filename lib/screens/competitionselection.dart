import 'package:flutter/material.dart';
import 'package:frc_scouting_app/models/event.dart';

class CompetitionSelection extends StatefulWidget {
  const CompetitionSelection({Key? key}) : super(key: key);

  @override
  State<CompetitionSelection> createState() => _CompetitionSelectionState();
}

class _CompetitionSelectionState extends State<CompetitionSelection> {
  late List<Event> events = [];
  Event? _dropdownSelected;

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  Future<void> getEvents() async {
    setState(() {
      events.add(
          Event("2022camb", "Monterey Bay Regional", "Seaside", "CA", "USA"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scouting App"),
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
                items: events
                    .map((e) => DropdownMenuItem<Event>(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList(),
                onChanged: (Event? e) {
                  setState(() {
                    _dropdownSelected = e!;
                  });
                },
                value: _dropdownSelected,
                hint: const Text("Please select an event!"),
              ),
            ),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, "/home",
                    arguments: _dropdownSelected);
              },
            )
          ],
        ),
      ),
    );
  }
}
