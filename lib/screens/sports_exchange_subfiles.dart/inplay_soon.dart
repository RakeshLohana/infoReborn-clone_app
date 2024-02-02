
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/inplay_events.dart';
import 'package:flutter/material.dart';

class InPlaySoon extends StatefulWidget {
  const InPlaySoon({super.key});

  @override
  State<InPlaySoon> createState() => _InPlaySoonState();
}

class _InPlaySoonState extends State<InPlaySoon> {
  
    // List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];

  @override
  Widget build(BuildContext context) {
       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(

      body: InPlayEvents()
      
    );
  }
}