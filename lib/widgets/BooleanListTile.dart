import 'package:flutter/material.dart';

class BooleanListTile extends StatefulWidget {
  String name;
  Function(bool) callback;
  bool currentValue = false;
  bool enabled;

  BooleanListTile(
      {required this.name,
      required this.callback,
      this.enabled = true,
      Key? key})
      : super(key: key);

  @override
  State<BooleanListTile> createState() => _BooleanListTileState();
}

class _BooleanListTileState extends State<BooleanListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.name),
        trailing: Checkbox(
          onChanged: widget.enabled
              ? (bool? value) {
                  setState(() {
                    widget.currentValue = value ?? widget.currentValue;
                  });
                  widget.callback(value!);
                }
              : null,
          value: widget.currentValue,
        ));
  }
}
