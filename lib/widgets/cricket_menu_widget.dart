import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Models/betfair_event_response.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'dart:math';


class SecondMenuWidget extends StatefulWidget {
  final eventId;
  // final String indexNew;
  final String type;


  final int indexNew;

// final String topString;

  const SecondMenuWidget({
    super.key,  required this.indexNew, required this.type, this.eventId,
  });

  @override
  State<SecondMenuWidget> createState() => _SecondMenuWidgetState();

}
        bool? isChecked1=false;
        bool? isChecked2=false;
            bool loading = false;




class _SecondMenuWidgetState extends State<SecondMenuWidget> {


 String? userEmail = FirebaseAuth.instance.currentUser!.email;
  String? username;
  String? userAmount;
  TextEditingController controller = TextEditingController();



     String betText1='Only Punters are Allowed To Make Bets. Contact Support';
    String betText2='Can not Place Bets. Invalid Amount ';
 Future<void> fetchUserAmount() async {
  if (userEmail != null) {
    username = userEmail;
  } else {
    // Handle the case where userEmail is null
  }

  try {
    QuerySnapshot postQuery = await FirebaseFirestore.instance
        .collection('posts')
        .where('username', isEqualTo: username)
        .get();

    double totalAmount = 0.0;

    postQuery.docs.forEach((doc) {
      final postData = doc.data() as Map<String, dynamic>;
      final amount = double.tryParse(postData['amount'] ?? '0.0'); // Convert to double
      totalAmount += amount!;
    });

    setState(() {
      userAmount = totalAmount.toStringAsFixed(2); // Update the userAmount variable as a formatted string
    });
  } catch (e) {
    print("Error fetching amount for user: $e");
    // Handle the error, e.g., show an error message
  }
}

 Future<void> updateAmountInFirestore(double newAmount) async {
  try {
    QuerySnapshot postQuery = await FirebaseFirestore.instance
        .collection('posts')
        .where('username', isEqualTo: username)
        .get();

    String docId = '';

    postQuery.docs.forEach((doc) {
      docId = doc.id;
    });

    // Subtract the amount from userAmount and convert it to a string
    String updatedAmount = (double.parse(userAmount!) - newAmount).toString();

    await FirebaseFirestore.instance.collection('posts').doc(docId).update({
      'amount': updatedAmount,
    });

    // Fetch the updated amount
    fetchUserAmount();
  } catch (e) {
    print("Error updating amount in Firestore: $e");
    // Handle the error, e.g., show an error message
  }
}









 



//  Future<void> fetchUserAmount() async {
//   if (userEmail != null) {
//     username = userEmail;
//   } else {
//     // Handle the case where userEmail is null
//   }

//   try {
//     QuerySnapshot postQuery = await FirebaseFirestore.instance
//         .collection('posts')
//         .where('username', isEqualTo: username)
//         .get();

//     double totalAmount = 0.0;

//     postQuery.docs.forEach((doc) {
//       final postData = doc.data() as Map<String, dynamic>;
//       final amount = double.tryParse(postData['amount'] ?? '0.0'); // Convert to double
//       totalAmount += amount!;
//     });

//     setState(() {
//       userAmount = totalAmount.toStringAsFixed(2); // Update the userAmount variable as a formatted string
//     });
//   } catch (e) {
//     print("Error fetching amount for user: $e");
//     // Handle the error, e.g., show an error message
//   }
// }

//  Future<void> updateAmountInFirestore(double newAmount) async {
//   try {
//     QuerySnapshot postQuery = await FirebaseFirestore.instance
//         .collection('posts')
//         .where('username', isEqualTo: username)
//         .get();

//     String docId = '';

//     postQuery.docs.forEach((doc) {
//       docId = doc.id;
//     });

//     // Subtract the amount from userAmount and convert it to a string
//     String updatedAmount = (double.parse(userAmount!) - newAmount).toString();

//     await FirebaseFirestore.instance.collection('posts').doc(docId).update({
//       'amount': updatedAmount,
//     });

//     // Fetch the updated amount
//     fetchUserAmount();
//   } catch (e) {
//     print("Error updating amount in Firestore: $e");
//     // Handle the error, e.g., show an error message
//   }
// }





  
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
    fetchUserRole();
    fetchUserAmount(); // Call the function to fetch the user role
  }
 // from 0 upto 99 included



  final String token = '174934-G2BfmL0xkgBnUk'; 


  @override
  Widget build(BuildContext context) {



    
       var rng = new Random();
     int randomNumber = rng.nextInt(10000);
     int randomNumber1 = rng.nextInt(1000);
    int randomNumber2 = rng.nextInt(1000);

    Services serv=Services();
        _navigate = NavigationService();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:   FutureBuilder<Welcome>(
          future: serv.fetchBetfairData(token, int.parse(widget.eventId)),
        // future:serv.fetchSportsOdd(widget.keyNew.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Text("Error Occured");
          } else {
            final data = snapshot.data!;
            // String apiDateString =  data[widget.indexNew]["commence_time"];
      // DateTime commenceDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(apiDateString);

    // Calculate the minimum allowed date and time (11:00 AM on the same day)
    // DateTime minAllowedDateTime = DateTime(commenceDateTime.year, commenceDateTime.month, commenceDateTime.day, 11, 0);
 

              return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        children: [
                                  
          
          
        Container(
          child: Column(
            children: [
               
              Column(
                children: [
                 
                 
                      
              
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.pinkColor),
        ),
         
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
           
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("(No UnMatch)",style: TextStyle(color: Colors.red, fontSize: 17,),),
            //        Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: height*0.2),
            //   child: Lottie.asset('assets/loader.json'),
            // ),

            //       Text(randomNumber1.toString()+"Msec",style: TextStyle(color: Colors.blue,fontSize: 17,),)
          
            //     ],
            //   )
          
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
                          
                                          GestureDetector(
                                            onTap: (){
                                           _navigate.navigateToRoute("/home");

                                            },
                                            child: Image.asset("assets/home.png",height: height*0.06,)),
                                       SizedBox(width: width*0.02,),
                          
                        Text("Cr 100000000",style: TextStyle(color: Colors.blue,fontSize: 15),),
                        SizedBox(width: width*0.02,),
                        Text("("+firebase_username.toString()+")",style: TextStyle(color: Colors.pink,fontSize: 16),),
                          
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
                              SizedBox(width: width*0.07,),
          
                          
                      Text("Risk 0",style: TextStyle(color: Colors.blue),),
                                                SizedBox(width: width*0.02,),
          
                      Text("Bal "+userAmount.toString(),style: TextStyle(color: Colors.green),),
          
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
                               _navigate.navigateToRoute("/administration");

                              
                            },
                             child: Container(
                              height: height*0.06,
                              width: width*0.13,
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
                       Text("Total Matched "+randomNumber2.toString(),style: TextStyle(color: Colors.red),),
                     
                      Text(" 1:58",style: TextStyle(color: Colors.purple))
                    ],
                  ),
          
          
                ],),

              ),
              Container(
                // width: width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                    
                      widget.type+" "+ data.results[0].markets[0].runners[0].description.runnerName.toString()+" Vs "+    data.results[0] .markets[0].runners[1].description.runnerName.toString(),overflow: TextOverflow.ellipsis
                    
                    
                    
                        // widget.type+"-"+data[widget.indexNew]["home_team"]+" VS "+data[widget.indexNew]["away_team"]
                        ,style: TextStyle(color: Colors.green)),
                    )
          
                  ],
                ),
              ),

               ConstrainedBox(
                constraints: BoxConstraints(
    minWidth: 50.0,
    minHeight: 20.0,
    maxHeight: 20.0,
  ),
                child: _buildMarquee()),
          
              Container(
                color: const Color.fromARGB(255, 166, 203, 234),
                child: Column(children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                         GestureDetector(
                            onTap: (){


                              
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
  String child0 =data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text("",
                      // child0,
                      style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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
                              // DialogBox(data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"].toString(),).showDialogMenu(context);
                              //  DateTime currentDateTime = DateTime.now();

                              // if (currentDateTime.isAfter(minAllowedDateTime)){
                              //   // DialogBox(data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"].toString(),(){

                              //   // },(){
                                  

                              //   // },_controller
                                  
                              //   // ).showDialogMenu(context);

                              // }
                              // else{
                              //   Toast.showToast(message: "Enjoy is not open ");
                              // }
                            }
                            );
                        },
                        child: Container(
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
                          
                          child: Center(
                            child: Text( 
                            //  data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString()
                             data.results.isNotEmpty &&
    data.results[0].markets.isNotEmpty &&
    data.results[0].markets[0].runners.isNotEmpty &&
    data.results[0].markets[0].runners[0].exchange != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'][0] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"] != null
        ? data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString()
        : " "
                              
      //                         data != null &&
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"].toString()
      //     : "N/A"
          ,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                        ),
                      ),




                       GestureDetector(
                        onTap: (){
                        //  DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"].toString()).showDialogMenu(context);

                            // DateTime currentDateTime = DateTime.now();

                            
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
  String child1 = data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text(
                      child1
                      ,style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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
                                // DialogBox(,,_controller).showDialogMenu(context);

                          
                              // else{
                              //   Toast.showToast(message: "Enjoy is not open ");
                              // }
                          
                        },
                         child: Container(
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
                          
                          child: Center(child: Text(
                            
                            //  data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["price"].toString()
                            data.results.isNotEmpty &&
    data.results[0].markets.isNotEmpty &&
    data.results[0].markets[0].runners.isNotEmpty &&
    data.results[0].markets[0].runners[0].exchange != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'][0] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["price"] != null
        ? data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["price"].toString()
        : "N/A"
      //                       data != null &&
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][1]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"].toString()
      //     : "N/A"
          ,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                          )
                          ),
                                 
                                 
                                             ),
                       ),
                       Text(data!.results[0].markets[0].runners[0].description.runnerName,
                        // data[widget.indexNew]["home_team"],
                        style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))
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
                            title: Text(data!.results[0].markets[0].runners[0].description.runnerName,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 13),
                              // data[widget.indexNew]["home_team"]
                              ),
                            value: isChecked1, onChanged: (bool? value){
                            setState(() {
                              isChecked1=value;
                            });
                          }),
                           CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(data!.results[0].markets[0].runners[1].description.runnerName
                            ,style:TextStyle(color: Colors.blue.shade900,fontSize: 13,fontWeight: FontWeight.bold)
                              // data[widget.indexNew]["away_team"]
                              ),
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
                      Column (
                        children: [
                           GestureDetector(
                            onTap: (){
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
  String child2= data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text(
                      
                      child2,
                      style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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
                                // DialogBox(data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"].toString(),).showDialogMenu(context);

                              //  DateTime currentDateTime = DateTime.now();

                              // if (currentDateTime.isAfter(minAllowedDateTime)){
              

                              // }
                              // else{
                              //   Toast.showToast(message: "Enjoy is not open ");
                              // }
                              
                            },
                             child: Container(
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
                                                     
                                                     child: Center(child: Text(
                                                      // data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString()
      //                                                 data != null &&

      data.results.isNotEmpty &&
    data.results[0].markets.isNotEmpty &&
    data.results[0].markets[0].runners.isNotEmpty &&
    data.results[0].markets[0].runners[0].exchange != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'][0] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"] != null
        ? data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString()
        : " "
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][0]["price"].toString()
      //     : "N/A"
           ,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                                                   ),
                           ),
                        Container(
                          color: Colors.yellow,
                          child: Text(data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["size"].toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14))),




                         GestureDetector(
                          onTap: (){
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
  String child3=data.results[0].markets[0].runners[1].exchange['availableToBack'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text(

                      child3
                      ,style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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
              

                              // DateTime currentDateTime = DateTime.now();

                              // if (currentDateTime.isAfter(minAllowedDateTime)){
                              //   // DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][1]["price"].toString(),).showDialogMenu(context);

                              // }
                              // else{
                              //   Toast.showToast(message: "Enjoy is not open ");
                              // }
                              
                           

                          },
                           child: Container(
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
                            
                            child: Center(child: Text(
                              
                              
                              // data.results[0].markets[0].runners[1].exchange['availableToBack'][0]["price"].toString(),

                              data.results.isNotEmpty &&
    data.results[0].markets.isNotEmpty &&
    data.results[0].markets[0].runners.length > 1 && // Check for at least 2 runners
    data.results[0].markets[0].runners[1].exchange != null &&
    data.results[0].markets[0].runners[1].exchange['availableToBack'] != null &&
    data.results[0].markets[0].runners[1].exchange['availableToBack'][0] != null &&
    data.results[0].markets[0].runners[1].exchange['availableToBack'][0]["price"] != null
        ? data.results[0].markets[0].runners[1].exchange['availableToBack'][0]["price"].toString()
        : ""
                              // data != null &&
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][0]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][1]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][0]["markets"][0]["outcomes"][1]["price"].toString()
      //     : "N/A"
                              
                              
                              
                              
                             ,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18))),
                                                 ),
                         ),
              
                        ],
                      )
                      ,
                      Column(
                        children: [
                             GestureDetector(
                              onTap: (){
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
  String child4= data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text(
                     
                      child4
                      
                      ,style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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

                            //  DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"].toString(),(){},(){

                            //  },_controller).showDialogMenu(context);

                                 
                              // DateTime currentDateTime = DateTime.now();

                              // if (currentDateTime.isAfter(minAllowedDateTime)){
                              //   DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"].toString(),).showDialogMenu(context);

                              // }
                              // else{
                              //   Toast.showToast(message: "Enjoy is not open ");
                              // }
                              
                           

                      

                              },
                               child: Container(
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
                                                       
                                                       child: Center(
                                                        child: Text(  
                                                          // data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'][0]["price"].toString(),

                                                           data.results.isNotEmpty &&
    widget.indexNew < data.results[0].markets.length &&
    data.results[0].markets[widget.indexNew].runners.isNotEmpty &&
    data.results[0].markets[widget.indexNew].runners[0].exchange != null &&
    data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'] != null &&
    data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'][0] != null &&
    data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'][0]["price"] != null
        ? data.results[0].markets[widget.indexNew].runners[0].exchange['availableToLay'][0]["price"].toString()
        : " ",
      //                                                      data != null &&
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][1]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][0]["price"].toString()
      //     : "N/A",
          style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                                                       )
                                                       ),
                                           
                                           
                                                     ),
                             ),
                         Container(
                          color: Colors.yellow,
                          child: Text(
                            // data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["size"].toString()
                          data.results.isNotEmpty &&
    data.results[0].markets.isNotEmpty &&
    data.results[0].markets[0].runners.isNotEmpty &&
    data.results[0].markets[0].runners[0].exchange != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'][0] != null &&
    data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["size"] != null
        ? data.results[0].markets[0].runners[0].exchange['availableToLay'][0]["size"].toString()
        : " "

                            ,style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 14))),


                           GestureDetector(
                            onTap: (){
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
  String child5=data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'][0]["price"].toString();
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
                    onPressed:(){

                                  Navigator.pop(context);

                                } ,
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
                    child: Center(child: Text(
                      
                      child5,
                      style:
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
                  onTap:(){
                                updateAmountInFirestore(double.parse(controller.text)).then((value) {
                                  Navigator.pop(context);
                                });



                                },
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
                              
                            //  DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][1]["price"].toString(),(){},(){
                              

                            // //  },_controller).showDialogMenu(context);

                           
                            //   DateTime currentDateTime = DateTime.now();

                            // if (currentDateTime.isAfter(minAllowedDateTime)){
                            // // DialogBox(data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][1]["price"].toString()).showDialogMenu(context);

                            // }
                            // else{
                            //   Toast.showToast(message: "Enjoy is not open ");
                            // }
                            // },
                            },
                             child: Container(
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
                                                     
                                                     child: Center(child: Text(
                                                      
                                                      // data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'][0]["price"].toString(),

                                                      data.results.isNotEmpty &&
    widget.indexNew < data.results[0].markets.length &&
    data.results[0].markets[widget.indexNew].runners.length > 1 && // Check for at least 2 runners
    data.results[0].markets[widget.indexNew].runners[1].exchange != null &&
    data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'] != null &&
    data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'][0] != null &&
    data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'][0]["price"] != null
        ? data.results[0].markets[widget.indexNew].runners[1].exchange['availableToLay'][0]["price"].toString()
        : " ",
      //                                                   data != null &&
      // widget.indexNew < data.length &&
      // data[widget.indexNew]["bookmakers"] != null &&
      // data[widget.indexNew]["bookmakers"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][1]["markets"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"].isNotEmpty &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"] != null &&
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"].length > 1 && // Check if index 1 exists
      // data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][1]["price"] != null
      //     ? data[widget.indexNew]["bookmakers"][1]["markets"][0]["outcomes"][1]["price"].toString()
      //     : "N/A",
          
          
          style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 18)
                                                     )
                                                     ),
                                         
                                         
                                                   ),
                           ),
              
                        ],
                      )
              
                    ],
                  )
                ],),
              )
              
          
            
          
          
        
          
          ]),
          
        );
              
              // return SecondMenuWidget(home_team: data[widget.index]["away_team"], type: "Match Ods", away_team: data[widget.index]["away_team"],);
          
          }
        },
          )

      
      ),
    );
  }

Widget _buildMarquee() {
    return Container(
      color: AppColors.pinkColor,
      child: Marquee(

        
    
      text: 'Play Fair <==> WIN MORE. Wrong ODDs // Rates, Wrong Fancy,Race Information Bets, Cheating Bets on Choka Chakka Out.Un-Fair rate cheating Bets. All will be deleted // Cancelled //voided even after Setteling. No Proof provided by us.Place genion bets and Enjoy.Play Fair <==> WIN MORE. Agar aap agree nheen hai koi bet na karen',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize:16,color: Colors.red), 
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
