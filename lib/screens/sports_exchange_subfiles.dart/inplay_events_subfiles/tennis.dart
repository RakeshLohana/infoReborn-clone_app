import 'package:bet_app/screens/sports_exchange_subfiles.dart/tennis_subfiles/tennis_subfiles_2/tennis_subfiles.dart';
import 'package:flutter/material.dart';

class TennisEvent extends StatefulWidget {
  const TennisEvent({super.key});

  @override
  State<TennisEvent> createState() => _TennisEventState();
}

class _TennisEventState extends State<TennisEvent> {
  @override
  Widget build(BuildContext context) {
    return TennisSubfiles2();
  }
}