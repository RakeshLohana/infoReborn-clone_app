
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles.dart';
import 'package:flutter/material.dart';

class Soccer extends StatefulWidget {
  const Soccer({super.key});

  @override
  State<Soccer> createState() => _SoccerState();
}

class _SoccerState extends State<Soccer> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      
      body: SoccerSubfiles()
      
    );
  }
}