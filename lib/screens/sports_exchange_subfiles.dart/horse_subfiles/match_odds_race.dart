import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Models/HorceRacing.dart';
import 'package:bet_app/Models/HorseDataResponse1.dart';
import 'package:bet_app/Models/HorseDataResponse2.dart';
import 'package:bet_app/Models/betfair_event_response.dart';
import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket_subfiles/match_odds_subfiles/match_odd_subfiles_subfiles/match_odd_bet.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/horse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

class MatchOddsRace extends StatefulWidget {
  // final String keyNew;
  //   final int indexNew;
  final String fiID;
  final String home;

  const MatchOddsRace({
    super.key,
    required this.fiID, required this.home,
  });

  @override
  State<MatchOddsRace> createState() => _MatchOddsRaceState();
}

class _MatchOddsRaceState extends State<MatchOddsRace> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool loading = false;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;
  String? username;
  String? userAmount;
  TextEditingController controller = TextEditingController();
  late NavigationService _navigate;

  String? firebase_username;

  String betText1 = 'Only Punters are Allowed To Make Bets. Contact Support';
  String betText2 = 'Can not Place Bets. Invalid Amount ';
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
        final amount =
            double.tryParse(postData['amount'] ?? '0.0'); // Convert to double
        totalAmount += amount!;
      });

      setState(() {
        userAmount = totalAmount.toStringAsFixed(
            2); // Update the userAmount variable as a formatted string
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

// Declare userRole as an instance variable

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

  @override
  Widget build(BuildContext context) {
    Services serv = Services();

    _navigate = NavigationService();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarColor,
        title: Text(
          "Select Event",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<HorseRaceWin?>(
        future: serv.fetchHorseRaceWin(widget.fiID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('No data Coming From API'));
          } else if (snapshot.hasData) {
            // Display your parsed Betfair data here
            final data = snapshot.data;

//       final desiredMarketNames = ["Match Odds", "To Win the Toss","Match Odds","Super Over","Completed Match"];

// final filteredMarkets = data!.results[0].markets.where((market) {
//   final marketName = market.description.marketName;
//   return desiredMarketNames.contains(marketName);


// }).toList();        
                    final apiResponse=data!.results![0].main!.sp!.winEachWay!.odds![0].oD;
                   int integerValue1=0;
                      String input = apiResponse!;
// Remove the "::::"
                      input = input.replaceAll("::::", "");

// Split the string by '/' to separate the numerator and denominator
                      List<String> parts = input.split("/");

                      if (parts.length == 2) {
                        int numerator = int.parse(parts[0]);
                        int denominator = int.parse(parts[1]);

                        // Calculate the integer value by dividing the numerator by the denominator
                        double result = numerator / denominator;

                        // Convert to an integer
                         integerValue1 = result.toInt();

                        // print("Integer value: $integerValue");
                      } else {
                        print("Invalid format");
                      }

            return Column(children: [
              Container(
                child: Column(
                  children: [
                    Column(
                      children: [],
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: AppColors.pinkColor),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "(No UnMatch)",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: height * 0.023,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Lottie.asset('assets/loader.json',
                              height: height * 0.0021)),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: height * 0.02),
                            child: Text(
                              "random" + "Msec",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: height * 0.017,
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 235, 235, 235),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _navigate.navigateToRoute("/home");
                                  },
                                  child: Image.asset(
                                    "assets/home.png",
                                    height: height * 0.06,
                                  )),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                "Cr 100000000",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                "(" + firebase_username.toString() + ")",
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Text("Active",
                            style: TextStyle(color: Colors.pink, fontSize: 14))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.07,
                            ),
                            Text(
                              "Risk 0",
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "Bal " + userAmount.toString(),
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Text("T.Liab", style: TextStyle(color: Colors.blue))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                _navigate.navigateToRoute("/administration");
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.13,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                      "assets/edit.png",
                                    )),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "Available",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text(
                              "1000202000",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        Text("Enjoy is open",
                            style: TextStyle(color: Colors.green))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              "(Match:0  )",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Text(
                          "Total Matched " + "ran",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(" 1:58", style: TextStyle(color: Colors.purple))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // width: width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(widget.home,
                      
                            // widget.type+" "+ data.results[0].markets[0].runners[0].description.runnerName.toString()+" Vs "+    data.results[0] .markets[0].runners[1].description.runnerName.toString(),
                            overflow: TextOverflow.ellipsis
                      
                            // widget.type+"-"+data[widget.indexNew]["home_team"]+" VS "+data[widget.indexNew]["away_team"]
                            ,
                            style: TextStyle(color: Colors.green)),
                      ),
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
                        onTap: () {
                          GestureDetector(onTap: () {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade100,
                                  Colors.blue.shade200
                                ],
                              ),
                              border: Border.all(color: Colors.grey, width: 2)),
                          margin: EdgeInsets.all(10),
                          height: height * 0.05,
                          width: width * 0.18,
                          child: Center(
                              child: Text(
                                integerValue1.toString()
                                  //  data.results[0].markets[0].runners[0].exchange['availableToBack'][0]["price"].toString()

                                  ,
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.pink.shade100,
                                  Colors.pinkAccent.shade100
                                ],
                              ),
                              // color: Colors.pink.shade200,
                              border: Border.all(color: Colors.grey, width: 2)),
                          margin: EdgeInsets.all(10),
                          height: height * 0.05,
                          width: width * 0.18,
                          child: Center(
                              child: Text( data.results![0].main!.sp!.winEachWay!.odds![0].oH!,
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))),
                        ),
                      ),
                      Text(data.results![0].main!.sp!.winEachWay!.odds![0].nA!,

                          // data!.results[0].markets[0].runners[0].description.runnerName,
                          // data[widget.indexNew]["home_team"],
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))
                    ],
                  )
                ]),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.01,
                    left: height * 0.01,
                    right: height * 0.01),
                child: ListView.builder(
                    itemCount: data.results![0].main!.sp!.winEachWay!.odds!.length,
                    itemBuilder: (context, index) {
                      // final marketName = filteredMarkets[index].description.marketName;
                      //   final marketType = data.results[0].markets[index].description.marketType;

                      //  if (marketType == "TO_WIN_THE_TOSS" || marketType == "MATCH_ODDS"||marketType == "TIED_MATCH"||marketType == "SUPER_OVER"||marketType == "COMPLETED_MATCH")
                      final odds = data.results![0].main!.sp!.winEachWay!.odds;

                      String? apiResponse =
                          data.results![0].main!.sp!.winEachWay!.odds![index].oH;
                          double integerValue=0;
                      String input = apiResponse!;
// Remove the "::::"
                      input = input.replaceAll("::::", "");

// Split the string by '/' to separate the numerator and denominator
                      List<String> parts = input.split("/");

                      if (parts.length == 2) {
                        int numerator = int.parse(parts[0]);
                        int denominator = int.parse(parts[1]);

                        // Calculate the integer value by dividing the numerator by the denominator
                        double result = numerator / denominator;

                        // Convert to an integer
                         integerValue = result;

                        // print("Integer value: $integerValue");
                      } else {
                        print("Invalid format");
                      }

                      double sumUpFractionalOdds(String fractionalOdds) {
                        List<String> oddsList =
                            fractionalOdds.split(','); // Split the odds
                        double sum = 0.0;

                        for (String odds in oddsList) {
                          List<String> parts = odds
                              .split('/'); // Split numerator and denominator
                          if (parts.length == 2) {
                            int numerator = int.parse(parts[0]);
                            int denominator = int.parse(parts[1]);

                            // Calculate decimal odds and add them to the sum
                            double decimalOdds = (numerator / denominator) + 1;
                            sum += decimalOdds;
                          }
                        }

                        return sum;
                      }

                      String fractionalOdds =
                          data.results![0].main!.sp!.winEachWay!.odds![index].oH!;
                      double summedDecimalOdds =
                          sumUpFractionalOdds(fractionalOdds);

                      return Column(children: [
                        Container(
                          color: Colors.blue.shade100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "name",
                                      // data.results[0].main.sp.fixed.odds[index].na,
                                      // data.results!.isNotEmpty &&
                                      //         data.results![0].main != null &&
                                      //         data.results[0].main.sp != null &&
                                      //         data.results![0].main!.sp!.fixed !=
                                      //             null &&
                                      //         data.results[0].main.sp!.fixed
                                      //                 .odds !=
                                      //             null &&
                                      //         index <
                                      //             data.results[0].main.sp.fixed
                                      //                 .odds.length &&
                                      //         data.results[0].main.sp.fixed
                                      //                 .odds[index].na !=
                                      //             null
                                      //     ? data.results[0].main.sp.fixed
                                      //         .odds[index].na
                                      //         .toString()
                                      //     : "",
                                      // data.results[0].main.sp.winEachWay.odds[index].na,
                                      // data!.results[0].markets[0].runners[0].description.runnerName,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      // data[widget.indexNew]["home_team"]
                                    ),
                                    value: isChecked1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked1 = value;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    GestureDetector(onTap: () {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.blue.shade100,
                                            Colors.blue.shade200
                                          ],
                                        ),
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    margin: EdgeInsets.all(10),
                                    height: height * 0.05,
                                    width: width * 0.18,
                                    child: Center(
                                        child: Text(
                                          integerValue.toString(),
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18))),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.pink.shade100,
                                            Colors.pinkAccent.shade100
                                          ],
                                        ),
                                        // color: Colors.pink.shade200,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    margin: EdgeInsets.all(10),
                                    height: height * 0.05,
                                    width: width * 0.18,
                                    child: Center(
                                        child: Text(
                                          // data.results![0].main!.sp!.winEachWay!.odds![index].oH!,
                                            summedDecimalOdds.toString(),
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ]);
                    }),
              ))
            ]);
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildMarquee() {
    return Container(
      color: AppColors.pinkColor,
      child: Marquee(
        text:
            'Play Fair <==> WIN MORE. Wrong ODDs // Rates, Wrong Fancy,Race Information Bets, Cheating Bets on Choka Chakka Out.Un-Fair rate cheating Bets. All will be deleted // Cancelled //voided even after Setteling. No Proof provided by us.Place genion bets and Enjoy.Play Fair <==> WIN MORE. Agar aap agree nheen hai koi bet na karen',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
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

class DialogBoxed extends StatefulWidget {
  final String child4;
  final double containerMargin;

  final double containerHeight;
  final TextEditingController controller;
  final double containerWidth;
  final double okverticalmargin;
  final double okContainerheight;
  final double okContainerWidth;

  const DialogBoxed(
      {super.key,
      required this.child4,
      required this.containerMargin,
      required this.containerHeight,
      required this.controller,
      required this.containerWidth,
      required this.okverticalmargin,
      required this.okContainerheight,
      required this.okContainerWidth});

  @override
  State<DialogBoxed> createState() => _DialogBoxedState();
}

class _DialogBoxedState extends State<DialogBoxed> {
  String? userEmail = FirebaseAuth.instance.currentUser!.email;
  String? username;
  String? userAmount;
  TextEditingController controller = TextEditingController();

  String betText1 = 'Only Punters are Allowed To Make Bets. Contact Support';
  String betText2 = 'Can not Place Bets. Invalid Amount ';
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
        final amount =
            double.tryParse(postData['amount'] ?? '0.0'); // Convert to double
        totalAmount += amount!;
      });

      setState(() {
        userAmount = totalAmount.toStringAsFixed(
            2); // Update the userAmount variable as a formatted string
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
        child: Container(
      height: height * 0.4,
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
                Text("Place Back/[Lagaya] Bet",
                    style: TextStyle(
                        fontSize: height * 0.022,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
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
                  margin: EdgeInsets.all(widget.containerMargin),
                  color: Colors.white,
                  child: Center(
                      child: Text(widget.child4,
                          style: TextStyle(
                              fontSize: height * 0.03,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold))),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(widget.containerMargin),
                  height: height * 0.1,
                  width: width * 0.34,
                  color: Colors.white,
                  child: TextFormField(
                    style: TextStyle(fontSize: height * 0.03),
                    controller: widget.controller,
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
                    child: Column(children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "00";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade400),
                              child: Center(
                                  child: Text("00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "600";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text("+600",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "1000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text(
                                "+1K",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "5000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text("+5K",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "10000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade400),
                              child: Center(
                                  child: Text("+10k",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "25000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text("+25k",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "100000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text(
                                "+100\nK",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.controller.text = "500000";
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.containerMargin,
                                  vertical: widget.containerMargin),
                              height: widget.containerHeight,
                              width: widget.containerWidth,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text("+500\nK",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold))),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateAmountInFirestore(
                              double.parse(widget.controller.text))
                          .then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: widget.containerMargin,
                          vertical: widget.okverticalmargin),
                      height: widget.okContainerheight,
                      width: widget.okContainerWidth,
                      decoration: BoxDecoration(color: Colors.grey.shade400),
                      child: Center(
                          child: Text("o\nk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink.shade600))),
                    ),
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: widget.containerMargin,
                vertical: widget.containerMargin),
            height: height * 0.05,
            width: width * 0.8,
            color: Colors.white,
            child: Center(
              child: Text("Un-Match Bets Not available",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ));
  }
}
