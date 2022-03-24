import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class NumberListTile extends StatefulWidget {
  String name;
  Function(double) callback;
  double step;
  late double currentValue;
  bool enabled;

  NumberListTile(
      {required this.name,
      required this.callback,
      this.step = 1,
      this.enabled = true,
      Key? key})
      : super(key: key) {
    currentValue = 0;
  }

  @override
  State<NumberListTile> createState() => _NumberListTileState();
}

class _NumberListTileState extends State<NumberListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: ListTile(
            title: Text(widget.name),
          ),
        ),
        Flexible(
          child: SpinBox(
            step: widget.step,
            min: 0,
            max: 200,
            keyboardType: TextInputType.number,
            value: widget.currentValue,
            onChanged: widget.enabled
                ? (double? d) {
                    setState(() {
                      widget.currentValue = d!;
                    });
                    widget.callback(d!);
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
