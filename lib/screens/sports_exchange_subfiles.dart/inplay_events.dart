import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:flutter/material.dart';

class InPlayEvents  extends StatefulWidget {


  const InPlayEvents({super.key,});

  @override
  State<InPlayEvents> createState() => _InPlayEventsState();
}

class _InPlayEventsState extends State<InPlayEvents> {
        List listNavigate=['/cric', '/soccerEvent',"/tennisEvent"];

    List listTitle=["Cricket ","Soccer","Tennis"];
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
                        _navigate.navigateToRoute(listNavigate[index]);

                      
                        
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