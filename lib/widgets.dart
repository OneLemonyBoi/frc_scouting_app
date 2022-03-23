import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class CardEntry extends StatelessWidget {
  const CardEntry(this.text, this.onTap,
      {Key? key, this.flexAmount = 1, this.fontSize = 24})
      : super(key: key);
  final String text;
  final int flexAmount;
  final double fontSize;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexAmount,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownListTile extends StatefulWidget {
  int team;
  String id;
  String name;
  List<String> choices;
  late String currentChoice;

  DropdownListTile(
      {required this.team,
      required this.id,
      required this.name,
      required this.choices,
      Key? key})
      : super(key: key) {
    currentChoice = this.choices.first;
  }

  @override
  State<DropdownListTile> createState() => _DropdownListTileState();
}

class _DropdownListTileState extends State<DropdownListTile> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {}

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
        onChanged: (String? s) {
          setState(() {
            widget.currentChoice = (s == null ? "" : s);
          });
          // if (Globals.currentEvent != null) {
          //   CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
          //   collection.doc("${widget.team}").update({
          //     widget.id: widget.currentChoice
          //   });
          // }
        },
        value: widget.currentChoice,
      ),
    );
  }
}

class NumberListTile extends StatefulWidget {
  int team;
  String id;
  String name;
  double min;
  double max;
  double step;
  double acceleration;
  late double currentValue;

  NumberListTile(
      {required this.team,
      required this.id,
      required this.name,
      this.min = 0,
      this.max = 100,
      this.step = 1,
      this.acceleration = 0.25,
      Key? key})
      : super(key: key) {
    currentValue = min;
  }

  @override
  State<NumberListTile> createState() => _NumberListTileState();
}

class _NumberListTileState extends State<NumberListTile> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    // CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
    // DocumentSnapshot<Object?> data = await collection.doc("${widget.team}").get();
    // collection.doc("${widget.team}").update({
    //   widget.id: widget.currentValue
    // });
    //
    // setState(() {
    //
    // });
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
            min: widget.min,
            max: widget.max,
            step: widget.step,
            acceleration: widget.acceleration,
            keyboardType: TextInputType.number,
            value: widget.currentValue,
            onChanged: (double? d) {
              setState(() {
                widget.currentValue = d == null ? widget.currentValue : d;
              });
              // if (Globals.currentEvent != null) {
              //   CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
              //   collection.doc("${widget.team}").update({
              //     widget.id: widget.currentValue
              //   });
              // }
            },
          ),
        ),
      ],
    );
  }
}

class BooleanListTile extends StatefulWidget {
  int team;
  String id;
  String name;
  bool currentValue = false;

  BooleanListTile(
      {required this.team, required this.id, required this.name, Key? key})
      : super(key: key);

  @override
  State<BooleanListTile> createState() => _BooleanListTileState();
}

class _BooleanListTileState extends State<BooleanListTile> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    // CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
    // //DocumentSnapshot<Object?> data = await collection.doc("${widget.team}").get();
    // collection.doc("${widget.team}").update({
    //   widget.id: widget.currentValue
    // });
    //
    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.name),
        trailing: Checkbox(
          onChanged: (bool? value) {
            setState(() {
              widget.currentValue = value == null ? widget.currentValue : value;
            });
            // if (Globals.currentEvent != null) {
            //   CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
            //   collection.doc("${widget.team}").update({
            //     widget.id: widget.currentValue
            //   });
            // }
          },
          value: widget.currentValue,
        ));
  }
}

class ParagraphListTile extends StatefulWidget {
  int team;
  String id;
  String label;

  ParagraphListTile(
      {required this.id, required this.team, required this.label, Key? key})
      : super(key: key);

  @override
  State<ParagraphListTile> createState() => _ParagraphListTileState();
}

class _ParagraphListTileState extends State<ParagraphListTile> {
  TextEditingController _paragraphController = TextEditingController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    // CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
    // //DocumentReference<Object?> docRef = collection.doc("${widget.team}");
    //
    // collection.doc("${widget.team}").update({
    //   widget.id: _paragraphController.value.text
    // });
    //
    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _paragraphController,
      onChanged: (s) {
        // if (Globals.currentEvent != null) {
        //   CollectionReference collection = FirebaseFirestore.instance.collection("${Constants.year}${Globals.currentEvent!.eventCode}");
        //   collection.doc("${widget.team}").update({
        //     widget.id: s
        //   });
        // }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          labelText: widget.label),
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 100,
    );
  }
}
