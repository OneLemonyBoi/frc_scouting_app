import 'package:flutter/material.dart';
import 'package:frc_scouting_app/constants.dart';
import 'package:frc_scouting_app/globals.dart';
import 'package:frc_scouting_app/widgets.dart';

class ScouterHomePage extends StatefulWidget {
  const ScouterHomePage({Key? key}) : super(key: key);

  @override
  _ScouterHomePageState createState() => _ScouterHomePageState();
}

class _ScouterHomePageState extends State<ScouterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.title),
          actions: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.4
              ),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, "/competition"),
                child: Text(
                  "Change Competition From ${Globals.currentEvent == null ? "None" : Globals.currentEvent!.shortName}",
                  style: TextStyle(fontSize: 14, overflow: TextOverflow.visible),
                  textAlign: TextAlign.center,
                )
              ),
            )
          ],
        ),
        body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  CardEntry("General Scouting", () {
                    if (Globals.currentEvent != null) Navigator.pushNamed(context, "/scouting/general/config");
                  }),
                  CardEntry("Match Scouting", () {

                  }),
                ],
              ),
            )
        )
    );
  }
}