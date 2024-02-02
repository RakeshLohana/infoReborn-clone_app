import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles.dart';
import 'package:flutter/material.dart';

class SoccerEvent extends StatefulWidget {
  const SoccerEvent({super.key});

  @override
  State<SoccerEvent> createState() => _SoccerEventState();
}

class _SoccerEventState extends State<SoccerEvent> {
  @override
  Widget build(BuildContext context) {
    return SoccerSubfiles();
  }
}