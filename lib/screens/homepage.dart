import 'package:flutter/material.dart';
import 'package:frc_scouting_app/models/event.dart';
import 'package:frc_scouting_app/widgets.dart';

class ScouterHomePage extends StatefulWidget {
  Event? event;
  ScouterHomePage({Key? key}) : super(key: key);

  @override
  _ScouterHomePageState createState() => _ScouterHomePageState();
}

class _ScouterHomePageState extends State<ScouterHomePage> {
  @override
  Widget build(BuildContext context) {
    widget.event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Scouting App"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CardEntry("General Scouting", () {
                Navigator.pushNamed(context, "/scouting/general/config",
                    arguments: widget.event);
              }),
              CardEntry("Match Scouting", () {
                Navigator.pushNamed(context, "/scouting/general/view",
                    arguments: widget.event);
              })
            ],
          ),
        ));
  }
}
