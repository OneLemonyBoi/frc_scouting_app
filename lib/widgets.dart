import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class CardEntry extends StatelessWidget {
  const CardEntry(
    this.text,
    this.onTap, {
    Key? key,
  }) : super(key: key);
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}

class ParagraphListTile extends StatefulWidget {
  String label;

  ParagraphListTile({required this.label, Key? key}) : super(key: key);

  @override
  State<ParagraphListTile> createState() => _ParagraphListTileState();
}

class _ParagraphListTileState extends State<ParagraphListTile> {
  final TextEditingController _paragraphController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _paragraphController,
      onChanged: (s) {
        setState(() {});
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          labelText: widget.label),
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: 100,
    );
  }
}
