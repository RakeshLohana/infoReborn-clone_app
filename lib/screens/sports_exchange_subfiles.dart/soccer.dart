
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles.dart';
import 'package:flutter/material.dart';

class Soccer extends StatefulWidget {
  const Soccer({super.key});

  @override
  State<Soccer> createState() => _SoccerState();
}

class _SoccerState extends State<Soccer> {
  
    // List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];

  @override
  Widget build(BuildContext context) {
       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
  
      
      body: SoccerSubfiles()
      
    );
  }
}