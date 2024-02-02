import 'package:bet_app/Services/services.dart';
import 'package:flutter/material.dart';

class SportsOdd extends StatefulWidget {
  const SportsOdd({super.key});

  @override
  State<SportsOdd> createState() => _SportsOddState();
}

class _SportsOddState extends State<SportsOdd> {
  @override
  Widget build(BuildContext context) {
        Services serv=Services();

    return Scaffold(
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            
            future:serv.fetchSportsOdd("cricket_icc_world_cup") ,
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
                  
                  title: Text(data[index].awyteam!),
                  subtitle: Text(data[index].bookmakers![0].markets![0].outcomes![0].price.toString()),
                );
        
              });
                
              }
             
             }),
        )

      ]),
    );
  }
}