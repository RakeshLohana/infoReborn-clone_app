import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MenuWidget extends StatefulWidget {
// final String topString;

  const MenuWidget({
    super.key,
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}
        bool? isChecked1=false;
        bool? isChecked2=false;
            bool loading = false;




class _MenuWidgetState extends State<MenuWidget> {
    late NavigationService _navigate;



  @override
  Widget build(BuildContext context) {
        _navigate = NavigationService();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:38),
                            child: Center(
                              child: loading?LinearProgressIndicator(
                                color: Colors.blue.shade800,
                              ):Text(
                                "No task to do",
                                style: TextStyle(
                                       fontSize: 15,
                                       color: Colors.blue.shade600,

                                  fontWeight: FontWeight.bold,
                    
                                ),
                              ),
                            ),
                          ),
                    ),
  
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
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.pinkColor),
            ),
          //  Expanded(
          //     flex: 1,
          //     child: _buildMarquee()),
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.yellow,
                    child: Text("Swipe for fancy Bets List", style: TextStyle(color: Colors.red),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("(No UnMatch)",style: TextStyle(color: Colors.red, fontSize: 17,),),
                      Expanded(
                      child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:38),
                            child: Center(
                              child: loading?LinearProgressIndicator(
                                color: Colors.blue.shade800,
                              ):Text(
                                "No task to do",
                                style: TextStyle(
                                 color: Colors.blue.shade600,
                                  fontSize: 12  ,
                                  fontWeight: FontWeight.bold,
                    
                                ),
                              ),
                            ),
                          ),
                    ),
                      Text("226 Msec",style: TextStyle(color: Colors.blue,fontSize: 17,),)
    
                    ],
                  )
    
                ],),
    
                  Container(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    child: Column(children: [
                      Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    
                        children: [
                          Expanded(
                            child: Row(children: [
                                         SizedBox(width: width*0.02,),
                              
                                              Image.asset("assets/home.png",height: 50,),
                                           SizedBox(width: width*0.02,),
                              
                            Text("Cr 100000000",style: TextStyle(color: Colors.blue,fontSize: 15),),
                            SizedBox(width: width*0.02,),
                            Text("(SMTopper)",style: TextStyle(color: Colors.pink,fontSize: 16),),
                              
                            ],),
                          ),
            
                          Text("Active",style: TextStyle(color: Colors.pink,fontSize: 14))
                        ],
                      ),
                        Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    
                        children: [
                          Row(
                            children: [
                                  SizedBox(width: width*0.05,),
    
                              
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
                                  _navigate.navigateToRoute("/home");
                                  
                                },
                                 child: Container(
                                  height: height*0.1,
                                  width: width*0.15,
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
    
    
                          Text("(Match:0  )",style: TextStyle(color: Colors.black),),
                         
    
                            ],
                          ),
                           Text("Total Matched 227",style: TextStyle(color: Colors.red),),
                         
                          Text(" 1:58",style: TextStyle(color: Colors.purple))
                        ],
                      ),
    
    
                    ],),
                  ),
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
                            Text("21.99",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14)),
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
                             Text("21.99",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14)),
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
      ),
    );
  }

  Widget _buildMarquee() {
    return Container(
      color: AppColors.pinkColor,
      child: Marquee(
      text: 'The quick brown fox jumps over the lazy dog',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize:20), 
      scrollAxis: Axis.horizontal, //scroll direction
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 50.0, //speed
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
