// import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/soccer_subfiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class SoccerSubfiles extends StatefulWidget {
  const SoccerSubfiles({super.key});

  @override
  State<SoccerSubfiles> createState() => _SoccerSubfilesState();
}



class _SoccerSubfilesState extends State<SoccerSubfiles> {

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
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
          
          
              BlueContainerWidget(eventsController: eventsController, height: height, twoListsIndex: 0,),
             BlueContainerWidget(eventsController: eventsController, height: height, twoListsIndex: 1,)
          
             
          
          
              
          //      Expanded(
          //       child: FutureBuilder<List<dynamic>>(
          //       future:serv.fetchSportsData(),
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return Center(child: CircularProgressIndicator()); // Loading indicator
          //         } else if (snapshot.hasError) {
          //           return Text('Error: ${snapshot.error}');
          //         } else {
          //           List<dynamic> data = snapshot.data!;
          
          
          //  List<dynamic>  filteredData = data.where((item) => item["active"]==true)
          //   .toList() ;
          //        List<dynamic>  filteredData2 = filteredData.where((item) => item["group"].toLowerCase().contains("Soccer".toLowerCase()))
          //   .toList() ;
            
               
          
            
                    
          //           return Padding(
          //       padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
          //             child: ListView.builder(
          //        itemCount: filteredData2.length,                        
          //             itemBuilder: (context,index){
          //               return GestureDetector(
          //                 onTap: (){
          //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SoccerSubfiles2(keyNew: filteredData2[index]["key"],)));
          //                 },
          //                 child:Container(
          //                   height: height*0.05,
          //                   decoration: BoxDecoration(
          //                     border: Border.all(color: Colors.grey),
          //                     color: AppColors.containerColor
                            
          //                   ),
          //                   child: Center(child: Text( filteredData2[index]["description"].toString(),style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize:22,color: AppColors.containerTextColor),)),
                            
          //                 )
          //               );
          //             }),
          //           );
          //         }
          //       },
          //     ),
          //     )
            
          
          ]),
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
                  padding:  EdgeInsets.symmetric(horizontal: height*0.04),
    
      child: eventsController.cricketData.value!.success!? ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
       itemCount: eventsController.soccerData.value!.response![twoListsIndex].activeEvents!.length,           
            itemBuilder: (context,index){
              final String soccerName=eventsController.soccerData.value!.response![twoListsIndex].activeEvents![index].title!;
             final String  eventKey=eventsController.soccerData.value!.response![twoListsIndex].activeEvents![index].eventKey!;
      
              return GestureDetector(
                onTap: (){
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SoccerSubfiles2(keyNew: eventKey,
                    )));
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