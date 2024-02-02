
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/tennis_subfiles/tennis_subfiles_2/tennis_subfiles.dart';
import 'package:flutter/material.dart';

class Tennis extends StatefulWidget {
  const Tennis({super.key});

  @override
  State<Tennis> createState() => _TennisState();
}

class _TennisState extends State<Tennis> {
  
    // List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];

  @override
  Widget build(BuildContext context) {
       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(

      
      body: TennisSubfiles2()
      
    );
  }
}