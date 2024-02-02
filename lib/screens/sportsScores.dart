import 'package:bet_app/Services/services.dart';
import 'package:flutter/material.dart';

class SportsScore extends StatefulWidget {
  const SportsScore({super.key});

  @override
  State<SportsScore> createState() => _SportsScoreState();
}

class _SportsScoreState extends State<SportsScore> {
  @override
  Widget build(BuildContext context) {
        Services serv=Services();

    return Scaffold(
      body: Column(
      
        children: [
          Center(
            child: Text("this is Rakesh"),
          ),
        Expanded(
          child: FutureBuilder(
            
            future:serv.fetchSportsScores() ,
             builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else{
                   final data=snapshot.data!;


                 return ListView.builder(
                  
                  itemCount: data.length,
        
                 itemBuilder: (context,index){
                 

                return ListTile(
                  
                  title: Text(data[index]["away_team"]),
                
                );
        
              });
                
              }
             
             }),
        )

      ]),
    );
  }
}