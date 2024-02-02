import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/widgets/menu.dart';
import 'package:bet_app/widgets/cricket_menu_widget.dart';
import 'package:flutter/material.dart';

class MatchOddsBets extends StatefulWidget {
   final String eventId;
     final String type;
     final int index;

  const MatchOddsBets({super.key, required this.eventId, required this.type, required this.index,});

  @override
  State<MatchOddsBets> createState() => _MatchOddsBetsState();
}

class _MatchOddsBetsState extends State<MatchOddsBets> {
    List listTitle=["(1:30 PM) Match Odds","(1:30 PM) Tied Match","(1:30 PM) To Win the Toss "];
         late NavigationService _navigate;

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return  SecondMenuWidget( 
      eventId: widget.eventId,
     indexNew: widget.index,
     type:widget.type,);
  }
}