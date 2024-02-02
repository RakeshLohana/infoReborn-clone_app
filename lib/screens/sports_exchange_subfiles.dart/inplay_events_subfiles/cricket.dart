import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket.dart';
import 'package:flutter/material.dart';

class CricketEvent extends StatefulWidget {
  const CricketEvent({super.key});


  @override
  State<CricketEvent> createState() => _CricketEventState();
}

class _CricketEventState extends State<CricketEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: CricketSub()
      );
}}