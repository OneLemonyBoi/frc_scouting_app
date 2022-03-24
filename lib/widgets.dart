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

// class GriddedCardEntry extends StatelessWidget {
//   const GriddedCardEntry(
//       {required this.text,
//       required this.onTap,
//       Key? key,
//       this.fontSize = 24,
//       this.message = ""})
//       : super(key: key);
//   final String text;
//   final double fontSize;
//   final Function(dynamic) callback;
//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       decoration: BoxDecoration(
//           color: Colors.black54,
//           borderRadius: BorderRadius.circular(10000000000000)),
//       preferBelow: false,
//       verticalOffset: 20,
//       message: message,
//       child: Card(
//         child: InkWell(
//           onTap: callback,
//           child: Center(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 24,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

void openInfoDialogueBox(
    BuildContext context, String title, dynamic description) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Text(description, textAlign: TextAlign.center),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Close'),
          child: const Text('Close'),
        )
      ],
    ),
  );
}

void openDecisionBox(
    BuildContext context, String title, dynamic description, String optionA, VoidCallback aAction, String optionB, VoidCallback bAction) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Text(description, textAlign: TextAlign.center),
      actions: <Widget>[
        TextButton(
          onPressed: aAction,
          child: Text(optionA),
        ),
        TextButton(
          onPressed: bAction,
          child: Text(optionB),
        )
      ],
    ),
  );
}
