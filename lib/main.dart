import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frc_scouting_app/backend/routeGenerator.dart';
import 'package:frc_scouting_app/screens/competitionselection.dart';
import 'package:frc_scouting_app/screens/generalscoutingconfiguration.dart';
import 'package:frc_scouting_app/screens/homepage.dart';
import 'package:frc_scouting_app/screens/loginpage.dart';
import 'package:frc_scouting_app/screens/viewscoutinginformationconfiguration.dart';
import 'backend/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => ScouterHomePage(),
        "/scouting/general/config": (context) => GeneralScoutingConfiguration(),
        "/competition": (context) => const CompetitionSelection(),
        "/scouting/general/view": (context) => ViewScoutingInfoConfiguration(),
//        "/scouting/general": (context) => const GeneralScouting(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ScouterLoginPage(),
    );
  }
}
