import 'dart:math';

import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

class CricketPlusFancy extends StatefulWidget {
// final String topString;

  const CricketPlusFancy({
    super.key,
  });

  @override
  State<CricketPlusFancy> createState() => _CricketPlusFancyState();
}
        bool? isChecked1=false;
        bool? isChecked2=false;
            bool loading = false;




class _CricketPlusFancyState extends State<CricketPlusFancy> {
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
        
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.yellow.shade200,
                  child: Text("Swipe for fancy Bets List", style: TextStyle(fontSize: height*0.015,color: Colors.red),)),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("(No UnMatch)",style: TextStyle(color: Colors.red, fontSize: height*0.023,),)),
                   Expanded(
                    flex: 2,
                    child: Lottie.asset('assets/loader.json',height: height*0.0021)),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:  EdgeInsets.only(left: height*0.02),
                      child: Text(randomNumber1.toString()+"Msec",style: TextStyle(color: Colors.blue,fontSize: height*0.017,),),
                    ))
          
                ],
              ),
           
    
              ],),
    
                Container(
                  color: const Color.fromARGB(255, 235, 235, 235),
                  child: Column(children: [
                    Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                                       SizedBox(width: width*0.02,),
                            
                                            GestureDetector(
                                              onTap:(){
                                                           _navigate.navigateToRoute("/home");

                                              },
                                              
                                              child: Image.asset("assets/home.png",height: height*0.055,)),
                                         SizedBox(width: width*0.02,),
                            
                          Text("Cr 100000000",style: TextStyle(color: Colors.blue,fontSize: 15),),
                          SizedBox(width: width*0.02,),
                          Text("("+firebase_username.toString()+")",style: TextStyle(color: Colors.purple,fontSize: 16),),
                            
                          ],),
                        ),
          
                        Text("In Play",style: TextStyle(color: Colors.pink,fontSize: 14))
                      ],
                    ),
                      Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    
                      children: [
                        Row(
                          children: [
                                SizedBox(width: width*0.08,),
    
                            
                        Text("Risk 0",style: TextStyle(color: Colors.blue),),
                         SizedBox(width: width*0.02,),
    
                        Text("Bal 120000",style: TextStyle(color: Colors.green),),
    
                          ],
                        ),
                        
    
                        Text("T.Liab",style: TextStyle(color: Colors.blue))
                      ],
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                      children: [
                        Row(
                          children: [
                        SizedBox(width: width*0.02,),
    
                             GestureDetector(
                              onTap: (){
                                
                              },
                               child: Container(
                                height: height*0.06,
                                width: width*0.12,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                  
                                    image: AssetImage("assets/edit.png",)
                             
                                  ),
                                  shape:BoxShape.circle
                                ),
                                 ),
                             ),
                                SizedBox(width: width*0.02,),
    
                        Text("Available",style: TextStyle(color: Colors.blue),),
                        Text("1000202000",style: TextStyle(color: Colors.blue),),
    
                          ],
                        ),
                       
                        Text("Enjoy is open",style: TextStyle(color: Colors.green))
                      ],
                    ),
                     
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                      children: [
                          SizedBox(width: width*0.02,),
    
                        Row(
                          children: [
    
    
                        Text("(Match:2  )",style: TextStyle(color: Colors.black),),
                       
    
                          ],
                        ),
                         Text("Total Matched 227",style: TextStyle(color: Colors.red),),
                       
                        Text(randomNumber3.toString()+":"+randomNumber2.toString(),style: TextStyle(color: Colors.purple))
                      ],
                    ),
    
    
                  ],),
                ),
               
               ConstrainedBox(
                constraints: BoxConstraints(
    minWidth: 50.0,
    minHeight: 20.0,
    maxHeight: 20.0,
  ),
                child: _buildMarquee('Play Fair <==> WIN MORE. Wrong ODDs // Rates, Wrong Fancy,Race Information Bets, Cheating Bets on Choka Chakka Out.Un-Fair rate cheating Bets. All will be deleted // Cancelled //voided even after Setteling. No Proof provided by us.Place genion bets and Enjoy.Play Fair <==> WIN MORE. Agar aap agree nheen hai koi bet na karen', Colors.red)),
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CSA- Boland Vs Lions",style: TextStyle(color: Colors.green))
    
                    ],
                  ),
                ),
    
                Container(
                  color: const Color.fromARGB(255, 166, 203, 234),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
    
                            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade100, Colors.blue.shade200],
              ),
                            border: Border.all(color: Colors.grey,width: 2)),
                          margin: EdgeInsets.all(10),
                          height: height*0.05,
                            width: width*0.18,
                          
                          child: Center(child: Text("1.74",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                        ),
                         Container(
                          decoration: BoxDecoration(
                             gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink.shade100, Colors.pinkAccent.shade100],
              ),
                            // color: Colors.pink.shade200,
                            border: Border.all(color: Colors.grey,width: 2)),
                          margin: EdgeInsets.all(10),
                           height: height*0.05,
                            width: width*0.18,
                          
                          child: Center(child: Text("1.75",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                          )
                          ),
    
    
                        ),
                        Text("Lions",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))
                      ],
                    )
                  ]),
                ),
                SizedBox(height: height*0.01,),
                Container(
                  color: Colors.blue.shade100,
                  child: Row(
                    children: [
                    Expanded(
                      child: Column(
                        children: [
                          CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Boland"),
                              value: isChecked1, onChanged: (bool? value){
                              setState(() {
                                isChecked1=value;
                              });
                            }),
                             CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Lions"),
                              value: isChecked2, onChanged: (bool? value){
                              setState(() {
                                isChecked2=value;
                              });
                            }),
                    
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                             Container(
                            decoration: BoxDecoration(
                
                              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade100, Colors.blue.shade200],
                              ),
                              border: Border.all(color: Colors.grey,width: 2)),
                            margin: EdgeInsets.all(10),
                            height: height*0.05,
                            width: width*0.18,
                            
                            child: Center(child: Text("1.74",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                          ),
                          Text(
                            randomNumber6.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14)),
                           Container(
                            decoration: BoxDecoration(
                
                              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade100, Colors.blue.shade200],
                              ),
                              border: Border.all(color: Colors.grey,width: 2)),
                            margin: EdgeInsets.all(10),
                           height: height*0.05,
                            width: width*0.18,
                            
                            child: Center(child: Text("1.74",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                          ),
                
                          ],
                        )
                        ,
                        Column(
                          children: [
                               Container(
                            decoration: BoxDecoration(
                               gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink.shade100, Colors.pinkAccent.shade100],
                              ),
                              // color: Colors.pink.shade200,
                              border: Border.all(color: Colors.grey,width: 2)),
                            margin: EdgeInsets.all(10),
                            height: height*0.05,
                            width: width*0.18,
                            
                            child: Center(child: Text("1.75",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                            )
                            ),
                
                
                          ),
                           Text(randomNumber7.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14)),
                             Container(
                            decoration: BoxDecoration(
                               gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink.shade100, Colors.pinkAccent.shade100],
                              ),
                              // color: Colors.pink.shade200,
                              border: Border.all(color: Colors.grey,width: 2)),
                            margin: EdgeInsets.all(10),
                           height: height*0.05,
                            width: width*0.18,
                            
                            child: Center(child: Text("1.75",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                            )
                            ),
                
                
                          ),
                
                          ],
                        )
                
                      ],
                    )
                  ],),
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
