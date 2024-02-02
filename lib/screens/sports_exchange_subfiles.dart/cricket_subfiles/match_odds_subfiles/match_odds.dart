import 'package:bet_app/Models/betfair_event_response.dart';
import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odd_subfiles_subfiles/match_odd_bet.dart';
import 'package:flutter/material.dart';

class MatchOdds extends StatefulWidget {
  // final String keyNew;
  //   final int indexNew;
  final time;
  final String eventId;




  const MatchOdds({super.key, required this.eventId, this.time, });

  @override
  State<MatchOdds> createState() => _MatchOddsState();
}

class _MatchOddsState extends State<MatchOdds> {
    List listTitle=["(1:30 PM) Match Odds","(1:30 PM) Tied Match","(1:30 PM) To Win the Toss "];
         late NavigationService _navigate;
    final String token = '174934-G2BfmL0xkgBnUk'; 

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

        body: FutureBuilder<Welcome>(
          future: serv.fetchBetfairData(token,int.parse(widget.eventId)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error Occured'));
            } else if (snapshot.hasData) {
              // Display your parsed Betfair data here
              final data = snapshot.data;
              

              
      final desiredMarketNames = ["Match Odds", "To Win the Toss","Match Odds","Super Over","Completed Match"];

final filteredMarkets = data!.results[0].markets.where((market) {
  final marketName = market.description.marketName;
  return desiredMarketNames.contains(marketName);
}).toList();
        
      return   Column(
        children: [
           Expanded(
            child: Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
                    itemCount:  filteredMarkets.length,
                  // itemCount:data!.results[0].markets.length,                    
                  itemBuilder: (context,index){
            final marketName = filteredMarkets[index].description.marketName;            
              final marketType = data.results[0].markets[index].description.marketType;

             




          //  if (marketType == "TO_WIN_THE_TOSS" || marketType == "MATCH_ODDS"||marketType == "TIED_MATCH"||marketType == "SUPER_OVER"||marketType == "COMPLETED_MATCH")
                    return GestureDetector(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchOddsBets(
                        
                        eventId: widget.eventId, type: marketName, index:index,

                      )));

                      
                        
                      },
                      child:Container(
                        height: height*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child: Text(
                      " ( " +widget.time+" ) "+ marketName,
                       textAlign: TextAlign.center,
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:22,color: AppColors.containerTextColor),)),
                        
                      )
                    );
              }),
                )
          )
        

        ]);
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      // body: Column(
      //   children: [
      //      Expanded(
      //       child: Padding(
      //       padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
      //             child: ListView.builder(
      //             itemCount: listTitle.length,
                        
      //             itemBuilder: (context,index){
      //               return GestureDetector(
      //                 onTap: (){
      //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchOddsBets(index:widget.indexNew,keyNew:widget.keyNew.toString())));

                      
                        
      //                 },
      //                 child:Container(
      //                   height: height*0.05,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.grey),
      //                     color: AppColors.containerColor
                        
      //                   ),
      //                   child: Center(child: Text(listTitle[index],style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize:22,color: AppColors.containerTextColor),)),
                        
      //                 )
      //               );
      //             }),
      //           )
      //     )
        

      // ]),
    );
  }
}