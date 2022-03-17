import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting_app/constants.dart';
import 'package:frc_scouting_app/requests.dart';
import 'package:frc_scouting_app/screens/generalscouting.dart';

class GeneralScoutingConfiguration extends StatefulWidget {
  const GeneralScoutingConfiguration({Key? key}) : super(key: key);

  @override
  State<GeneralScoutingConfiguration> createState() => _GeneralScoutingConfigurationState();
}

class _GeneralScoutingConfigurationState extends State<GeneralScoutingConfiguration> {
  TextEditingController _teamNumberController = TextEditingController();
  String _teamName = "No Team Found";

  Future<void> _openScoutingScreen(BuildContext context) async {
    // TODO: Replace with API Call for team
    String str = "No Team Found";
    if (str != "No Team Found") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(
            builder: (context) => GeneralScouting(
                teamID: int.parse(_teamNumberController.value.text)
            )
        )
      );
    }
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.01),
              child: TextFormField(
                controller: _teamNumberController,
                onChanged: (s) async {
                  String text = ""; // TODO: Replace with API Call for team name
                  setState(() {
                    _teamName = text;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Enter Team Number"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.01),
              child: Text(
                _teamName,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.01),
              child: ElevatedButton(
                style: TextButton.styleFrom(primary: Colors.black, backgroundColor: Colors.yellow.shade100),
                onPressed: () => _openScoutingScreen(context),
                child: Text("Start Scouting")
              ),
            )
          ],
        ),
      ),
    );
  }
}
