import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting_app/Team.dart';
import 'package:frc_scouting_app/api.dart';
import 'package:frc_scouting_app/screens/generalscouting.dart';

class GeneralScoutingConfiguration extends StatefulWidget {
  const GeneralScoutingConfiguration({Key? key}) : super(key: key);

  @override
  State<GeneralScoutingConfiguration> createState() =>
      _GeneralScoutingConfigurationState();
}

class _GeneralScoutingConfigurationState
    extends State<GeneralScoutingConfiguration> {
  final TextEditingController _teamNumberController = TextEditingController();
  String _teamName = "No Team Found";

  Future<void> _openScoutingScreen(BuildContext context) async {
    if (_teamNumberController.value.text.isNotEmpty) {
      Team team = await getTeam(int.parse(_teamNumberController.value.text));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => GeneralScouting(team: team)));
    } else {
      showModalBottomSheet(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text("Please select a team to scout"),
                    ],
                  ),
                ),
              ));
    }
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
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: TextFormField(
                controller: _teamNumberController,
                onChanged: (s) async {
                  if (s == "") {
                    setState(() {
                      _teamName = "No Team Found";
                    });
                  } else {
                    Team team = await getTeam(int.parse(s));
                    setState(() {
                      _teamName = team.nickname!;
                    });
                  }
                },
                decoration:
                    const InputDecoration(labelText: "Enter Team Number"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Text(
                _teamName,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.yellow.shade100),
                  onPressed: () => _openScoutingScreen(context),
                  child: const Text("Start Scouting")),
            )
          ],
        ),
      ),
    );
  }
}
