import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odds.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/match_odd/match_odd.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SoccerSubfiles2 extends StatefulWidget {
  final String keyNew;

  const SoccerSubfiles2({super.key, required this.keyNew, });

  @override
  State<SoccerSubfiles2> createState() => _SoccerSubfiles2State();
}

class _SoccerSubfiles2State extends State<SoccerSubfiles2> {
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
            child: FutureBuilder<List<dynamic>>(
            future:serv.fetchSportsOdd(widget.keyNew.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<dynamic> data = snapshot.data!;
                return Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
                  itemCount: data.length,
                        
                  itemBuilder: (context,index){
                     DateTime dateTime = DateTime.parse(data[index]["commence_time"].toString());
                      String format = DateFormat.jm().format(dateTime);


                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SoccerMatchOdds(keyNew: data[index]["sport_key"],indexNew: index,)));
                      
                        
                      },
                      child:Container(
                        height: height*0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child: Text("("+format+") "+data[index]["home_team"].toString()+" Vs "+data[index]["away_team"].toString(),textAlign: TextAlign.center,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:17,color: AppColors.containerTextColor),)),
                        
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