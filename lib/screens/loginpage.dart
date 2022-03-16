import 'package:flutter/material.dart';
import 'package:frc_scouting_app/constants.dart';

class ScouterLoginPage extends StatefulWidget {
  const ScouterLoginPage({Key? key}) : super(key: key);

  @override
  State<ScouterLoginPage> createState() => _ScouterLoginPageState();
}

class _ScouterLoginPageState extends State<ScouterLoginPage> {
  final String _password = "SOR6059Scouting";
  String _helperText = "";
  final TextEditingController _passwordController = TextEditingController();

  void _checkPassword(String password) {
    if (password == _password) {
      Navigator.pushReplacementNamed(context, "/competition");
    } else {
      setState(() {
        _helperText = "The passkey was incorrect. Please try again.";
      });
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
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.25),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Write Your Passkey Here!",
                    labelText: "Passkey",
                    helperText: _helperText,
                  ),
                )),
            TextButton(
                child: Text("Check Passkey"),
                onPressed: () =>
                    _checkPassword(_passwordController.value.text)),
          ],
        ),
      ),
    );
  }
}