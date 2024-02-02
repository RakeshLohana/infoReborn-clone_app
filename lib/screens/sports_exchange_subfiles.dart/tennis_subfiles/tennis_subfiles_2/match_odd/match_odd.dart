import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odd_subfiles_subfiles/match_odd_bet.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/match_odd/match_odd_bet/match_odd_bet.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/tennis_subfiles/tennis_subfiles_2/match_odd/match_odd_bet/match_odd_bet.dart';
import 'package:flutter/material.dart';

class TennisMatchOdds extends StatefulWidget {

 final String time;
 final int index;
  

  const TennisMatchOdds({super.key,required this.time, required this.index});

  @override
  State<TennisMatchOdds> createState() => _TennisMatchOddsState();
}

class _TennisMatchOddsState extends State<TennisMatchOdds> {
    List listTitle=["Match Odds"];
         late NavigationService _navigate;

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,

        backgroundColor:AppColors.appBarColor ,
        title: Text("Select Event",style: TextStyle(color: Colors.white),),),
      body: Column(
        children: [
           Expanded(
            child: Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
                  itemCount: listTitle.length,
                        
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TennisMatchOddsBets(index: widget.index,)));

                      
                        
                      },
                      child:Container(
                        height: height*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child: Text("("+widget.time+") "+listTitle[index],textAlign: TextAlign.center,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:22,color: AppColors.containerTextColor),)),
                        
                      )
                    );
                  }),
                )
          )
        

      ]),
    );
  }
}