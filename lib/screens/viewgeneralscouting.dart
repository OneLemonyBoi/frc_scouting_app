import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frc_scouting_app/team.dart';
import 'package:frc_scouting_app/widgets.dart';

class ViewGeneralScouting extends StatefulWidget {
  Team team;
  ViewGeneralScouting({Key? key, required this.team}) : super(key: key);

  @override
  State<ViewGeneralScouting> createState() => _ViewGeneralScoutingState();
}

class _ViewGeneralScoutingState extends State<ViewGeneralScouting> {
  bool enabled = false;
  Map<String, dynamic> teamInfo = {};
  bool loading = true;
  Future<void> getTeamData() async {
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection('2022camb')
        .doc("${widget.team.teamNumber}")
        .get();
    if (ds.data() != null) {
      setState(() {
        teamInfo = ds.data() as Map<String, dynamic>;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getTeamData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String filler = "FRC Team ${widget.team.key?.substring(3)} -";

    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.team.nickname} - ${widget.team.teamNumber}"),
        ),
        body: teamInfo.isNotEmpty
            ? !loading
                ? GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 13,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (ctx, i) {
                      return Tooltip(
                        message: teamInfo.keys.toList()[i],
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.circular(10000000000000)),
                        preferBelow: false,
                        verticalOffset: 20,
                        child: Card(
                          child: InkWell(
                            onTap: () {
                              openInfoDialogueBox(
                                  context,
                                  teamInfo.keys.toList()[i],
                                  "${teamInfo.values.toList()[i]}");
                            },
                            child: Center(
                              child: Text(
                                teamInfo.keys.toList()[i],
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : const CircularProgressIndicator()
            : const Center(
                child: Text("This team is yet to be scouted!"),
              )

        // GridView.count(
        //   crossAxisCount: 2,
        //   childAspectRatio: 2,
        //   children: [
        //     GriddedCardEntry(
        //         text: "Hubs Shot At",
        //         onTap: () {
        //           openInfoDialogueBox(
        //               context, "$filler Hubs Shot At", "[insert firebase call]");
        //         },
        //         message: "Hubs the Robot Shoots at"),
        //     GriddedCardEntry(
        //         text: "ok1",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok1", "hola");
        //         },
        //         message: ""),
        //     GriddedCardEntry(
        //         text: "ok2",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok2", "hola");
        //         },
        //         message: ""),
        //     GriddedCardEntry(
        //         text: "ok3",
        //         onTap: () {
        //           openInfoDialogueBox(context, "ok3", "hola");
        //         },
        //         message: "")
        //   ],
        // ),
        );
  }
}
