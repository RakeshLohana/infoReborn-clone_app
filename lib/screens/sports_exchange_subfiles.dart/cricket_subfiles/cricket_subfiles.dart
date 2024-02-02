import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odds.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CricketSubfiles extends StatefulWidget {
  // final String keyNew;
   final String leagueName;


  const CricketSubfiles({super.key, required this.leagueName, });

  @override
  State<CricketSubfiles> createState() => _CricketSubfilesState();
}

class _CricketSubfilesState extends State<CricketSubfiles> {
    List listNavigate=["/market","/inplayEve",'/inplay','/cric', '/soccer','/tennis','/horse','/grey'];
    List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];
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
            child: FutureBuilder<UpcomingEvent>(
            future:serv.getUpcomingEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {

                final data = snapshot.data;
              final events = data!.results;
             final filteredEvents = events
                  .where((event) => event.league.name == widget.leagueName) // Replace with the desired league name
                  .toList();




                // List<dynamic> data = snapshot.data!;
                return Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
                  itemCount: filteredEvents.length,
              
                        
                  itemBuilder: (context,index){

            final unixTimestamp = int.parse(filteredEvents[index].time);
final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
final formattedTime = DateFormat('h:mm a').format(dateTime);
                    
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchOdds(
                          eventId:filteredEvents[index].id,
                          time:formattedTime,
                          // keyNew: data[index]["sport_key"],indexNew: index,
                          )));
                      
                        
                      },
                      child:Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: height*0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child:
                        Text(
                          filteredEvents[index].home.name+" V "+filteredEvents[index].away.name,
                          
                        //  Text(data[index]["home_team"].toString()+" Vs "+data[index]["away_team"].toString(),
                           textAlign: TextAlign.center,
                         style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18,color: AppColors.containerTextColor),)),
                        
                      )
                    );
                  }),
                );
              }
            },
          ),
          )
        

      ]),
    );
  }
}