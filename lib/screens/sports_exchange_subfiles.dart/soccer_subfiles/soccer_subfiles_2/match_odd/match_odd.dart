import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odd_subfiles_subfiles/match_odd_bet.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/match_odd/match_odd_bet/match_odd_bet.dart';
import 'package:flutter/material.dart';

class SoccerMatchOdds extends StatefulWidget {
  final String keyNew;
    final int indexNew;

  const SoccerMatchOdds({super.key, required this.keyNew, required this.indexNew});

  @override
  State<SoccerMatchOdds> createState() => _SoccerMatchOddsState();
}

class _SoccerMatchOddsState extends State<SoccerMatchOdds> {
    List listTitle=["(4:35 PM) Over/ Under 3.5 Goals","Match Odds","(4:35 PM) Over/Under 2.5 Goals","(4:35 PM) Over/Under 1.5 Goals "];
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SoccerMatchOddsBets(index:widget.indexNew,keyNew:widget.keyNew.toString())));

                      
                        
                      },
                      child:Container(
                        height: height*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child: Text(listTitle[index],style: TextStyle(
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