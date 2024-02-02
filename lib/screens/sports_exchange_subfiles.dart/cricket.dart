// import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/cricket_subfiles.dart';
import 'package:flutter/material.dart';

class CricketSub extends StatefulWidget {
  const CricketSub({super.key});

  @override
  State<CricketSub> createState() => _CricketSubState();
}

class _CricketSubState extends State<CricketSub> {
    // List listNavigate=["/market","/inplayEve",'/inplay','/cric', '/soccer','/tennis','/horse','/grey'];
    // List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];
        //  late NavigationService _navigate;
         

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        // _navigate=NavigationService();   

       double height=MediaQuery.of(context).size.height;
    // double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

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
                // List<dynamic> data = snapshot.data!;

                //  List<String> sportsToFilter = ['tennis', 'Soccer', 'Cricket'];
                 final data = snapshot.data;
                final events = data!.results;

              // Group events by league name
              final eventsByLeague = <String, List<Event>>{};

              events.forEach((event) {
                final leagueName = event.league.name;

                if (!eventsByLeague.containsKey(leagueName)) {
                  eventsByLeague[leagueName] = [];

                }
                eventsByLeague[leagueName]!.add(event);

              });

        

      //  List<dynamic>  filteredData = data.where((item) => item["group"].toLowerCase().contains("Cricket".toLowerCase()))
      //   .toList() ;
        
                
                return Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
             itemCount:eventsByLeague.length,                
                  itemBuilder: (context,index){
                       final leagueName = eventsByLeague.keys.elementAt(index);
                  final matches = eventsByLeague[leagueName]!;
                    return GestureDetector(
                      onTap: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CricketSubfiles(
                          leagueName: leagueName,
                          )));
                      },
                      child:Container(
                        height: height*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child:
                         Text(leagueName,
                        //  Text( filteredData[index]["description"].toString(),
                         style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:22,color: AppColors.containerTextColor),)),
                        
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