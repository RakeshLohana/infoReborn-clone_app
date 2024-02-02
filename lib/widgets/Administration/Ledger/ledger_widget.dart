import 'package:flutter/material.dart';

class LedgerWidget extends StatefulWidget {
  const LedgerWidget({super.key});

  @override
  State<LedgerWidget> createState() => _LedgerWidgetState();
}

class _LedgerWidgetState extends State<LedgerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color.fromARGB(255, 243, 241, 228),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Opening Blanace"),
          Text("34553"),
          Text("34553"),
      ],
      ),
    );
  }
}