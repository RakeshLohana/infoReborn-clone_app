import 'dart:math';

import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

class Fancy extends StatefulWidget {
// final String topString;

  const Fancy({
    super.key,
  });

  @override
  State<Fancy> createState() => _FancyState();
}
        bool? isChecked1=false;
        bool? isChecked2=false;
            bool loading = false;




class _FancyState extends State<Fancy> {
    late NavigationService _navigate;

      String? firebase_username; // Declare userRole as an instance variable

  Future<void> fetchUserRole() async {
    try {
      final role = await getroll();
      setState(() {
        firebase_username = role; // Assign the role to the instance variable
      });
    } catch (e) {
      print(e.toString());
    }
  }
  

  @override
  void initState() {
    super.initState();
    fetchUserRole(); // Call the function to fetch the user role
  }



  @override
  Widget build(BuildContext context) {
        var rng = new Random();
     int randomNumber3 = rng.nextInt(12);
     int randomNumber1 = rng.nextInt(1000);
    int randomNumber2 = rng.nextInt(60);
         int randomNumber5 = rng.nextInt(1000);

     int randomNumber6 = rng.nextInt(1000);
          int randomNumber7= rng.nextInt(1000);


    

        _navigate = NavigationService();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: height*0.01,vertical: height*0.026),
        child: Column(
          children: [
                                    
    
          Container(
            height: height*0.06,
            child: Center(child: Text("Currently No Fancy Event,Wait for next",style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold ,fontSize:17,),)),
            decoration: BoxDecoration(color: AppColors.topBar),
          ),
        
    
          Container(
            child: Column(
              children: [
                 
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Lions",style: TextStyle(fontWeight:FontWeight.bold ,fontSize:17,color: Color.fromARGB(202, 154, 39, 4)),),
                        SizedBox(width: width*0.02,),
                        Container(
                             height: height*0.05,
                           width: width*0.17,
                          decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              border: Border.all(color: Colors.grey)),
                          child: Center(child: Text("0.74")),
                        ),
                        SizedBox(
                          width: width * 0.02,
                         
                        ),
                        Container(
                          height: height*0.05,
                           width: width*0.17,
                          decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              border: Border.all(color: Colors.grey)),
                          child: Center(child: Text("0.75",)),
                        )
                      ],
                    ),
                 
                 Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Text(
                      "[ Lay/No]",
                      style: TextStyle(
                        fontWeight:FontWeight.bold ,fontSize:17,
                        color: Colors.red),
                    )),
                  ),
                 Expanded(
                    flex: 2,
                    child: Lottie.asset('assets/loader.json',height: height*0.0021)),
  
                  Container(
                    decoration: BoxDecoration(),
                    child: Center(
                        child: Text(
                      "[ Back/yes]",
                      style: TextStyle(
                        fontWeight:FontWeight.bold ,fontSize:17,
                        color: Colors.blue.shade900),
                    )),
                  ),
                ],
                
                        ),
                        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                        Container(
                height: height*0.07,
                width: width*0.35,
                    decoration: BoxDecoration(
                       border: Border.all(
                        color: Colors.grey
                      ),
                      color: AppColors.blueColor
                    ),
                    child: Center(
                        child: Text(
                      ": ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.red),
                    )),
                  ),
                   Container(
                    height: height*0.07,
                width: width*0.35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey
                      ),
                                        color: AppColors.greenColor
                
                    ),
                    child: Center(
                        child: Text(
                      ":",
                      style: TextStyle(
                         fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue),
                    )),
                  ),
                ],
                        ),
                   
                        
                
                  ],
                ),
                  SizedBox(height: height*0.03,),
                    ConstrainedBox(
                constraints: BoxConstraints(
    minWidth: 50.0,
    minHeight: 20.0,
    maxHeight: 20.0,
  ),
                child: _buildMarquee("PENALTY RUNS ARE NOT ADDED IN RUNNIG SESSION.IF Player FACE one ball then Players/Wicket Fancy Must Settle on Inning End(Even on Retire/Allout/chase/tie/rain/cancell/noresult). Over Fancy will be cancelled if overs not Complete due to any reason but on Chase/Tie All Overs/Wicket etc. Fancy Sessions Settled on Last Score", Colors.purple)),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.pinkColor),
          ),
          SizedBox(height: height*0.02,),

          Container(
            height: height*0.06,
            decoration: BoxDecoration(
              color: AppColors.pinkColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(width*0.01),
                  height: height*0.05,
                  decoration: BoxDecoration(
              color: Colors.yellow.shade200),
                  child: Center(child: Text(firebase_username.toString(),style: TextStyle(color: Colors.brown,fontSize: height*0.028,fontWeight: FontWeight.bold),)),
                ),
                Row(
                  children: [
                    Text(
                      "Bal.",style: TextStyle(color: Colors.blue.shade900),
                    ),
                    SizedBox(width: width*0.01,),
                    Text(
                      "Rsk.",style: TextStyle(color: Colors.blue.shade900),
                    
                    )
                  ],
                )



              ],
            ),
          )
        
          
    
              
               
            
    
          
            
                
    
              
    
    
          
    
        ]),
        
      ),
    );
  }

 Widget _buildMarquee(String textIn,Color color1) {
    return Container(
      color: AppColors.pinkColor,
      child: Marquee(

        
    
      text: textIn,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize:16,color:color1), 
      scrollAxis: Axis.horizontal, //scroll direction
      crossAxisAlignment: CrossAxisAlignment.center,
      blankSpace: 20.0,
      velocity: 40.0, //speed
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    ),
    );
  }
}
