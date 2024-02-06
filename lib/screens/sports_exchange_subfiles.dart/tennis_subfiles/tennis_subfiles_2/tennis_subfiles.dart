import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/controller/controller.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odds.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/match_odd/match_odd.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/tennis_subfiles/tennis_subfiles_2/match_odd/match_odd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TennisSubfiles2 extends StatefulWidget {

  const TennisSubfiles2({super.key,  });

  @override
  State<TennisSubfiles2> createState() => _TennisSubfiles2State();
}

class _TennisSubfiles2State extends State<TennisSubfiles2> {
late EventsController eventsController;
         @override
  void initState() {
    // TODO: implement initState
    eventsController=Get.put(EventsController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        // Services serv=Services();


       double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,

        backgroundColor:AppColors.appBarColor ,
        title: Text("Select Event",style: TextStyle(color: Colors.white),),),
        body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: height*0.045),
          child: Column(
            children: [
          
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    BlueContainerWidget(eventsController: eventsController, height: height,twoListsIndex: 0,),
                        
                  BlueContainerWidget(eventsController: eventsController, height: height,twoListsIndex: 1,),
                ],
              )
         
            
          
          ]),
        ),
      ),
      // body: Column(
      //   children: [
      //      Expanded(
      //       child: FutureBuilder<List<dynamic>>(
      //       future:serv.fetchTennisOdd(),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return Center(child: CircularProgressIndicator()); // Loading indicator
      //         } else if (snapshot.hasError) {
      //           return Text('Error: ${snapshot.error}');
      //         } else {
      //           List<dynamic> data = snapshot.data!;
      //           return Padding(
      //       padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
      //             child: ListView.builder(
      //             itemCount: data.length,
                        
      //             itemBuilder: (context,index){
      //                DateTime dateTime = DateTime.parse(DateTime.now().toString());
      //                 String format = DateFormat.jm().format(dateTime);


      //               return GestureDetector(
      //                 onTap: (){
      //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>TennisMatchOdds(index: index, time: format,)));
                      
                        
      //                 },
      //                 child:Container(
      //                   height: height*0.08,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.grey),
      //                     color: AppColors.containerColor
                        
      //                   ),
      //                   child: Center(child: Text("("+format+") "+data[index]["Home Player"].toString()+" Vs "+data[index]["Away Player"].toString(),textAlign: TextAlign.center,style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize:17,color: AppColors.containerTextColor),)),
                        
      //                 )
      //               );
      //             }),
      //           );
      //         }
      //       },
      //     ),
      //     )
        

      // ]),
    );
  }
}


class BlueContainerWidget extends StatelessWidget {
  final int twoListsIndex;
  const BlueContainerWidget({
    super.key,
    required this.eventsController,
    required this.height, required this.twoListsIndex,
  });

  final EventsController eventsController;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: height*0.04),
    
      child: eventsController.tennisdata.value!.success!? ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
       itemCount: eventsController.tennisdata.value!.response![twoListsIndex].activeEvents!.length,           
            itemBuilder: (context,index){
              final String soccerName=eventsController.tennisdata.value!.response![twoListsIndex].activeEvents![index].title!;
             final String  eventKey=eventsController.tennisdata.value!.response![twoListsIndex].activeEvents![index].eventKey!;
          DateTime dateTime = DateTime.parse(DateTime.now().toString());
                      String format = DateFormat.jm().format(dateTime);
              return GestureDetector(
               onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TennisMatchOdds(index: index, time: format, keyNew: eventKey,)));
                      
                        
                      },
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: AppColors.containerColor
                  
                  ),
                  child: Center(child:
                   Text(soccerName,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    
                    fontSize:22,color: AppColors.containerTextColor),)),
                  
                )
              );
            }):CircularProgressIndicator(),
    );
  }
}