import 'package:flutter/material.dart';

class BooleanListTile extends StatefulWidget {
  String name;
  Function(bool) callback;
  bool? currentValue;
  bool enabled;

  BooleanListTile(
      {required this.name,
      required this.callback,
      this.enabled = true, this.currentValue,
      Key? key})
      : super(key: key) {
    currentValue ?? false;
  }

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
