import 'package:flutter/material.dart';


class DialogBox{
   String bet="0";
   VoidCallback onTap1;
   VoidCallback onTap2;
   TextEditingController controller;
   DialogBox( this.bet,this.onTap1,this.onTap2,this.controller);

void showDialogMenu(BuildContext context){

  // TextEditingController _controller=TextEditingController();


  






showDialog(
        context: context,
        builder: (BuildContext context) {
      
            double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
      double containerHeight=height * 0.06;
          double containerWidth=width * 0.15;
          double containerMargin=height*0.005;

          double okContainerheight=height*0.14;
          double okContainerWidth=width*0.073;
          double okverticalmargin=height*0.02;
  String child1 = bet;
  String betText1='Only Punters are Allowed To Make Bets. Contact Support';
    String betText2='Can not Place Bets. Invalid Amount ';


  
          return Dialog(
            child: Container(
              height: height*0.4,

        color: Colors.blue,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: height * 0.04,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "assets/sport.png",
                      height: height * 0.08,
                    ),
                  ),
                  Text(
                    "Place Back/[Lagaya] Bet",
                    style: TextStyle(
                    fontSize: height*0.022,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold)
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: onTap1,
                    icon: Icon(Icons.close,),
                  
                    color: Colors.red,
                    iconSize: 20,
                    
                    
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.34,
                    margin: EdgeInsets.all(containerMargin),
                    color: Colors.white,
                    child: Center(child: Text(child1,style:
                                        TextStyle(
                                       fontSize: height*0.03,
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.bold))),
                  ),
                ),
                Expanded(
                  child: Container(
                    
                    margin: EdgeInsets.all(containerMargin),

                    height: height * 0.1,
                    width: width * 0.34,
                    color: Colors.white,
                    child: TextFormField(
                      style: TextStyle(fontSize: height*0.03),
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                            border: InputBorder.none,

                    
                        filled: true,
                        fillColor: Colors.white,
                        
                      ),
                                  
                     
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Color.fromARGB(255, 160, 225, 230),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child: Column(
                    children: [
                    Row(

                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.text="00";
                          
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                            height: containerHeight,
                            width: containerWidth,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade400),
                            child: Center(
                                child: Text("00",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        ),
                        GestureDetector(
                           onTap: (){
                            controller.text="600";
                          
                          },
                          child: Container(
                           margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                            height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text("+600",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                            controller.text="1000";
                          
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                            height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text(
                              "+1K",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                          controller.text="5000";


                          },
                          child: Container(
                           margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                          height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text("+5K",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                          GestureDetector(
                            onTap: (){
                              controller.text="10000";

                            },
                            child: Container(
                                                   margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                                                  height: containerHeight,
                            width: containerWidth,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade400),
                            child: Center(
                                child: Text("+10k",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))),
                                                  ),
                          ),
                        GestureDetector(
                          onTap: (){
                            controller.text="25000";

                          },
                          child: Container(
                           margin: EdgeInsets.symmetric(horizontal:containerMargin),
                            height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text("+25k",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))),
                          ),
                        ),
                        GestureDetector(
                           onTap: (){
                            controller.text="100000";

                          },
                          child: Container(
                           margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical:containerMargin),
                           height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text(
                              "+100\nK",
                              textAlign: TextAlign.center
                              ,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){
                            controller.text="500000";

                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                          height: containerHeight,
                            width: containerWidth,
                            color: Colors.grey.shade400,
                            child: Center(
                                child: Text("+500\nK",
                             textAlign: TextAlign.center,
                        
                                    style:
                                        TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold))),
                          ),
                        )
                      ],
                    )
                  ]),
                ),

                GestureDetector(
                  onTap: onTap2,
                  child: Container(
                            margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: okverticalmargin),
                            height: okContainerheight,
                            width: okContainerWidth,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade400),
                            child: Center(
                                child: Text("o\nk",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.pink.shade600)
                                        )),
                          ),
                ),
              ]),
            ),
            
            Container(
             margin: EdgeInsets.symmetric(horizontal:containerMargin,vertical: containerMargin),
                          height: height * 0.05,
                          width: width*0.8,

              color: Colors.white,
              child: Center(
                child: Text(
                  "Un-Match Bets Not available",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)
                ),
              ),
            )
          ],
        ),
            )
          );
        });

}


}

// void _showBottomSheet(BuildContext context,String bet) {
//   double height = MediaQuery.of(context).size.height;
//   double width = MediaQuery.of(context).size.width;
//   String child1 = bet;
//   String child2 = "Bet Amt.";
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(0),
//         topLeft: Radius.circular(0),
//       ),
//     ),
//     builder: (BuildContext builderContext) {
//       return Container(
//         color: Colors.blue,
//         child: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               height: height * 0.05,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Image.asset(
//                       "assets/sport.png",
//                       height: height * 0.08,
//                     ),
//                   ),
//                   Text(
//                     "Place Back/[Lagaya] Bet",
//                     style: TextStyle(
//                     fontSize: height*0.016,
//                     color: Colors.blue.shade900,
//                     fontWeight: FontWeight.bold)
//                   ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       Toast.showToast(message: "Enjoy is canceled");
//                     },
//                     icon: Icon(Icons.close,),
                  
//                     color: Colors.red,
//                     iconSize: 20,
                    
                    
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: height * 0.1,
//                   width: width * 0.46,
//                   margin: EdgeInsets.all(10),
//                   color: Colors.white,
//                   child: Center(child: Text(child1,style:
//                                       TextStyle(
//                                         color: Colors.grey.shade500,
//                                         fontWeight: FontWeight.bold))),
//                 ),
//                 Container(
//                   height: height * 0.1,
//                   width: width * 0.46,
//                   margin: EdgeInsets.all(10),
//                   color: Colors.white,
//                   child: Center(child: Text(child2, style:
//                                       TextStyle(
//                                         color: Colors.grey.shade500,
//                                         fontWeight: FontWeight.bold))),
//                 )
//               ],
//             ),
//             Container(
//               color: Color.fromARGB(255, 160, 225, 230),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Container(
//                   child: Column(
//                     children: [
//                     Row(

//                       children: [
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           decoration:
//                               BoxDecoration(color: Colors.grey.shade400),
//                           child: Center(
//                               child: Text("00",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold))),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text("+600",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold))),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text(
//                             "+1K",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text("+5K",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold))),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                           Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           decoration:
//                               BoxDecoration(color: Colors.grey.shade400),
//                           child: Center(
//                               child: Text("+10k",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold))),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text("+25k",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold))),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text(
//                             "+100K",
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold),
//                           )),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.1,
//                           width: width * 0.16,
//                           color: Colors.grey.shade400,
//                           child: Center(
//                               child: Text("+5K",
//                                   style:
//                                       TextStyle(
//                                         color: Colors.red,
//                                         fontWeight: FontWeight.bold))),
//                         )
//                       ],
//                     )
//                   ]),
//                 ),

//                 Container(
//                           margin: EdgeInsets.all(10),
//                           height: height * 0.2,
//                           width: width * 0.1,
//                           decoration:
//                               BoxDecoration(color: Colors.grey.shade400),
//                           child: Center(
//                               child: Text("ok",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)
//                                       )),
//                         ),
//               ]),
//             ),
            
//             Container(
//               margin: EdgeInsets.all(10),
//                           height: height * 0.08,
//                           width: width*0.8,

//               color: Colors.white,
//               child: Center(
//                 child: Text(
//                   "Un-Match Bets Not available",
//                   style: TextStyle(
//                     fontSize: 23,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold)
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }

