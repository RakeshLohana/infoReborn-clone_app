import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/widgets/cricket_plus_fancy.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyMarket extends StatefulWidget {
  const MyMarket({Key? key}) : super(key: key);

  @override
  State<MyMarket> createState() => _MyMarketState();
}

class _MyMarketState extends State<MyMarket> {
  final NavigationService _navigate = GetIt.I<NavigationService>();
  List listTitle = [
    "Match Odds V Pakistan Vs Bangladesh",
    "Match Odds V SE Korda v H... Vs Bangladesh",
    "Winner V ICC World Cup",
  ];

  List checkedItems = [false, false, false]; // Track checked items

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text("Select Event3", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                                      _navigate.navigateToPage(CricketPlusFancy());

                },
                child: Container(
                  width: width * 0.3,
                  height: height * 0.05,
                  decoration: BoxDecoration(color: AppColors.buttonColor),
                  child: Center(
                    child: Text(
                      "ALL MARKET",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.02),
              GestureDetector(
                onTap: () {
                                      _navigate.navigateToPage(CricketPlusFancy());

                },
                child: Container(
                  width: width * 0.3,
                  height: height * 0.05,
                  decoration: BoxDecoration(color: AppColors.buttonColor),
                  child: Center(
                    child: Text(
                      "SELECT MARKET",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.04, ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listTitle.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigate.navigateToPage(CricketPlusFancy());
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkedItems[index],
                        onChanged: (value) {
                          setState(() {
                            checkedItems[index] = value ?? false;
                          });
                        },
                      ),
                      Container(
                        width: width*0.8,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor,
                        ),
                        child: Center(
                          child: Text(
                            listTitle[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: AppColors.containerTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
