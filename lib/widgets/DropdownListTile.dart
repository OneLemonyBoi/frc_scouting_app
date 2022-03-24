import 'package:flutter/material.dart';

class StringDropDown extends StatefulWidget {
  final Function(String) callback;
  final String name;
  final List<String> choices;
  String? currentChoice;
  final bool enabled;
  StringDropDown(
      {Key? key,
      required this.name,
      required this.callback,
      required this.choices,
      this.enabled = true, this.currentChoice})
      : super(key: key) {
    currentChoice = currentChoice ?? choices.first;
  }

  @override
  State<StringDropDown> createState() => _StringDropDownState();
}

class _StringDropDownState extends State<StringDropDown> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      trailing: DropdownButton<String>(
        items: widget.choices
            .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: widget.enabled
            ? (String? s) {
                setState(() {
                  widget.currentChoice = s!;
                });
                widget.callback(s!);
                // print("onChange: " + widget.currentChoice);
              }
            : null,
        value: widget.currentChoice,
      ),
    );
  }
}
