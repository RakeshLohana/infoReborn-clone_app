// import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/controller/controller.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/cricket_subfiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CricketSub extends StatefulWidget {
  const CricketSub({super.key});

  @override
  State<CricketSub> createState() => _CricketSubState();
}

class _CricketSubState extends State<CricketSub> {

late EventsController eventsController;
         @override
  void initState() {
    // TODO: implement initState
    eventsController=Get.put(EventsController());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
        Services serv=Services();


       double height=MediaQuery.of(context).size.height;
       

    
    return Scaffold(
      appBar: AppBar(

        backgroundColor:AppColors.appBarColor ,
        title: Text("Select Event",style: TextStyle(color: Colors.white),),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: height*0.045),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
               BlueContainerWidget(eventsController: eventsController, height: height,twoListsIndex: 0,),
                   
             BlueContainerWidget(eventsController: eventsController, height: height,twoListsIndex: 1,),
           ],
                        ),
        ),
      ),
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
    padding: EdgeInsets.symmetric(horizontal: context.width*0.04),
      child: eventsController.cricketData.value!.success!? ListView.builder(
        shrinkWrap: true,
       itemCount: eventsController.cricketData.value!.response![twoListsIndex].activeEvents!.length,           
            itemBuilder: (context,index){
              final String cricketName=eventsController.cricketData.value!.response![twoListsIndex].activeEvents![index].title!;
             final String  eventKey=eventsController.cricketData.value!.response![twoListsIndex].activeEvents![index].eventKey!;
      
              return GestureDetector(
                onTap: (){
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CricketSubfiles(
                    leagueName:eventKey ,
                    )));
                },
                child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: AppColors.containerColor
                  
                  ),
                  child: Center(child:
                   Text(cricketName,
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