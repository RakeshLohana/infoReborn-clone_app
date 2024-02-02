import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/widgets/SoccerSecondMenuWidget.dart';
import 'package:bet_app/widgets/Tennis.dart';
import 'package:bet_app/widgets/TennisSecondMenuWidget.dart';
import 'package:bet_app/widgets/menu.dart';
import 'package:bet_app/widgets/cricket_menu_widget.dart';
import 'package:flutter/material.dart';

class TennisMatchOddsBets extends StatefulWidget {

  final int index;

  const TennisMatchOddsBets({super.key, required this.index, });

  @override
  State<TennisMatchOddsBets> createState() => _TennisMatchOddsBetsState();
}

class _TennisMatchOddsBetsState extends State<TennisMatchOddsBets> {
         late NavigationService _navigate;

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return  TennisSecondMenuWidget(index: widget.index,);
  }
}