import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/widgets/SoccerSecondMenuWidget.dart';
import 'package:bet_app/widgets/menu.dart';
import 'package:bet_app/widgets/cricket_menu_widget.dart';
import 'package:flutter/material.dart';

class SoccerMatchOddsBets extends StatefulWidget {
  final int index;
  final String keyNew;
  const SoccerMatchOddsBets({super.key, required this.index, required this.keyNew});

  @override
  State<SoccerMatchOddsBets> createState() => _SoccerMatchOddsBetsState();
}

class _SoccerMatchOddsBetsState extends State<SoccerMatchOddsBets> {
    List listTitle=["(1:30 PM) Match Odds","(1:30 PM) Tied Match","(1:30 PM) To Win the Toss "];
         late NavigationService _navigate;

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return  SoccerSecondMenuWidget( keyNew: widget.keyNew.toString(),indexNew: widget.index,type: "Match odds ", bookmakerIndex1: 0, bookmakerIndex2: 1,);
  }
}