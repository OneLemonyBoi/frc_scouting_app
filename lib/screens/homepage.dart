import 'package:flutter/material.dart';
import 'package:frc_scouting_app/models/event.dart';
import 'package:frc_scouting_app/widgets.dart';

class ScouterHomePage extends StatefulWidget {
  const ScouterHomePage({Key? key, Event? event}) : super(key: key);

  @override
  _ScouterHomePageState createState() => _ScouterHomePageState();
}

class _ScouterHomePageState extends State<ScouterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Scouting App"),
          actions: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4),
              child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "/competition"),
                  child: const Text(
                    "Test",
                    style:
                        TextStyle(fontSize: 14, overflow: TextOverflow.visible),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CardEntry("General Scouting", () {
                Navigator.pushNamed(context, "/scouting/general/config");
              }),
              CardEntry("Match Scouting", () {})
            ],
          ),
        ));
  }
}
