import 'package:bet_app/widgets/cricket_plus_fancy.dart';
import 'package:bet_app/widgets/menu.dart';
import 'package:flutter/material.dart';

class CricketFancy extends StatefulWidget {
  const CricketFancy({super.key});

  @override
  State<CricketFancy> createState() => _CricketFancyState();
}

class _CricketFancyState extends State<CricketFancy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CricketPlusFancy()
    );
  }
}